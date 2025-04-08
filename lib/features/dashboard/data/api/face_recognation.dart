import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lockbox_app/features/dashboard/data/api/token_to_firebase.dart';
import 'package:lockbox_app/utils/constants/database.dart';

Future<void> sendToBackend(File imageFile, String name, String docId) async {
  final Firedata firedata = Firedata();
  final request = http.MultipartRequest(
    'POST',
    Uri.parse(Config.registerFaceUrl),
  );
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
  request.fields['name'] = name;
  request.fields['doc_id'] = docId;

  final response = await request.send();
  await firedata.createOrUpdate(docId);
  final result = await http.Response.fromStream(response);

  print("✅ Response: ${result.body}");
}
