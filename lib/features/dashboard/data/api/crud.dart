import 'package:cloud_firestore/cloud_firestore.dart';

class Firedata {
  final FirebaseFirestore lockStatus = FirebaseFirestore.instance;

  Future<void> createOrUpdate(String docId) async {
    try {
      DocumentReference docRef = lockStatus
          .collection("lock_status")
          .doc(docId);
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Jika dokumen sudah ada, lakukan update
        if (docSnapshot.get('status') == "terbuka") {
          await docRef.update({'status': 'tertutup'});
        } else {
          await docRef.update({'status': 'terbuka'});
        }
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
}
