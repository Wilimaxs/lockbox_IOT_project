import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lockbox_app/features/dashboard/data/api/token_to_email.dart';
import 'package:lockbox_app/utils/constants/database.dart';
import 'package:lockbox_app/utils/helpers/functions.dart';

class Firedata {
  static final Firedata instance = Firedata();
  final FirebaseFirestore lockStatus = FirebaseFirestore.instance;

  Future<void> createOrUpdate(String docId) async {
    try {
      DocumentReference docRef = lockStatus
          .collection(Config.collectStatus)
          .doc(docId);
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Jika dokumen sudah ada, lakukan update
        String currentStatus = docSnapshot.get('status') ?? "tertutup";
        await docRef.update({
          'status': currentStatus == "terbuka" ? "tertutup" : "terbuka",
        });
        print("Document updated successfully");
      } else {
        // Jika dokumen belum ada, buat baru
        await docRef.set({'status': 'tertutup'});
        print("Document created successfully");
      }
    } catch (e) {
      print("Error handling document: ${e.toString()}");
    }
  }

  Future<void> saveOtpToFirestore(
    String email,
    String otp,
    String docId,
  ) async {
    final docRef = lockStatus.collection(Config.collectCode).doc(docId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update({
        "otp": otp,
        "email": email,
        "timestamp": FieldValue.serverTimestamp(),
        "status": "valid",
      });
      print("OTP updated successfully");
    } else {
      await docRef.set({
        "otp": otp,
        "email": email,
        "timestamp": FieldValue.serverTimestamp(),
        "status": "valid",
      });
      print("OTP saved successfully");
    }
  }

  Future<void> cekEmail(
    String docId,
    String email,
    int index,
    BuildContext context,
  ) async {
    try {
      DocumentSnapshot docsnap =
          await lockStatus.collection(Config.collectCode).doc(docId).get();
      DocumentSnapshot docsnapInside =
          await lockStatus.collection(Config.collectIn).doc(docId).get();

      if (!context.mounted) return;

      if (!docsnap.exists) {
        String otp = generateOTP();
        await instance.saveOtpToFirestore(email, otp, 'locker${index + 1}');
        docsnap =
            await lockStatus.collection(Config.collectCode).doc(docId).get();
      }

      String inside = docsnapInside.get('status') ?? "";
      String emailFirestore = docsnap.get('email') ?? "";

      if (inside == 'filled') {
        if (email == emailFirestore) {
          await instance.createOrUpdate('locker${index + 1}');
          String otp = generateOTP();
          await sendOtpEmail(email, otp);
          await instance.saveOtpToFirestore(email, otp, 'locker${index + 1}');
          if (!context.mounted) return;
          showPopup(context, 'OTP has been sent to email');
        } else {
          if (!context.mounted) return;
          showPopup(context, 'Bukan Owner');
        }
      } else {
        await instance.createOrUpdate('locker${index + 1}');
        String otp = generateOTP();
        await sendOtpEmail(email, otp);
        await instance.saveOtpToFirestore(email, otp, 'locker${index + 1}');
      }
    } catch (e) {
      if (!context.mounted) return;
      showPopup(context, 'Terjadi kesalahan $e');
    }
  }

  void showPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Peringatan"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}
