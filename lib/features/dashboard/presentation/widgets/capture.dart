import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lockbox_app/features/dashboard/data/api/face_recognation.dart';

final ImagePicker _picker = ImagePicker();

Future<void> captureAndPreviewImage({
  required BuildContext context,
  required String name,
  required String docId,
}) async {
  final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  if (pickedFile == null) return;

  if (!context.mounted) return;

  final file = File(pickedFile.path);

  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          title: const Text("Preview Wajah"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(file, height: 200),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  sendToBackend(file, name, docId);
                },
                child: const Text("Oke"),
              ),
            ],
          ),
        ),
  );
}
