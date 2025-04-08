import 'package:http/http.dart' as http;
import 'package:lockbox_app/utils/constants/database.dart';
import 'dart:convert';

import 'package:lockbox_app/utils/constants/email.dart';



// Fungsi untuk kirim email via Brevo API
Future<void> sendOtpEmail(String email, String otp) async {
  final url = Uri.parse(Config.brevoUrl);
  final headers = {
    "accept": "application/json",
    "api-key": Brevo.apiKey,
    "content-type": "application/json",
  };
  final body = jsonEncode({
    "sender": {"name": "OTP lockbox", "email": Brevo.email},
    "to": [
      {"email": email},
    ],
    "subject": "🔐 Your OTP Code - Secure Access",
    "htmlContent": """
    <html>
      <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
        <div style="max-width: 500px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0,0,0,0.1);">
          <h2 style="color: #333; text-align: center;">🔐 Secure Login Code</h2>
          <p style="font-size: 16px; color: #555; text-align: center;">
            Use the following OTP to access your account securely:
          </p>
          <div style="font-size: 24px; font-weight: bold; text-align: center; background: #007BFF; color: white; padding: 10px; border-radius: 5px; letter-spacing: 4px;">
            $otp
          </div>
          <p style="font-size: 14px; color: #555; text-align: center; margin-top: 20px;">
            This OTP is valid for <strong>5 minutes</strong>. Do not share this code with anyone.
          </p>
          <hr style="border: none; border-top: 1px solid #ddd;">
          <p style="font-size: 12px; color: #888; text-align: center;">
            If you didn’t request this code, please ignore this email or contact support.
          </p>
        </div>
      </body>
    </html>
    """,
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 201) {
    print("OTP sent successfully to $email");
  } else {
    print("Failed to send OTP: ${response.body}");
  }
}
