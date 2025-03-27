import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _PrivacyProtectionScreenState();
}

class _PrivacyProtectionScreenState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Lottie Animation
              Lottie.asset(
                'assets/lottie/Animation.json',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                    'Protect your privacy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideX(begin: -0.1, end: 0, duration: 600.ms),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                    'Applock keeps your apps private with strong passwords ensuring a smooth and secure phone experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 600.ms)
                  .slideX(begin: 0.1, end: 0, duration: 600.ms),

              const SizedBox(height: 40),

              // Start Button
              ElevatedButton(
                    onPressed: () {
                      // Add navigation or action
                      Navigator.pushReplacementNamed(context, 'dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 64,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 900.ms)
                  .scaleXY(begin: 0.8, end: 1, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
