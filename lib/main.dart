import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lockbox_app/features/dashboard/presentation/pages/dashboard.dart';
import 'package:lockbox_app/utils/constants/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Config.options);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masbox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DashboardPage(),
    );
  }
}
