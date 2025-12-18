import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Same gradient colors as home screen
    const gradientColors = [
      Color(0xFFD0E8FF),
      CupertinoColors.activeGreen,
      Colors.white,
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black87),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Terms of Use',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 40,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Terms of Use',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 28 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Last Updated: Nov 25, 2025',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildParagraph(
                        'Thank you for using FoodZeen! These Terms of Use ("Terms") govern your access to and use of the FoodZeen mobile application (the "App"), including all features, content, and services we offer. By using the App, you agree to these Terms — so please take a moment to read them carefully.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('1. Using FoodZeen', isMobile),
                      _buildParagraph(
                        'When you use FoodZeen, you agree to use it responsibly and respectfully. You must be at least 13 years old to use the app. Some features may require you to create an account using your email and a secure password.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('2. Subscriptions', isMobile),
                      _buildParagraph(
                        'Some features of FoodZeen are available through a paid subscription. Subscriptions automatically renew unless cancelled at least 24 hours before the current period ends. You can manage or cancel your subscription at any time in your device\'s Account Settings.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('3. Privacy', isMobile),
                      _buildParagraph(
                        'Your privacy is important to us. We securely store the information you provide and process it in line with our Privacy Policy. By using the app, you agree to how we collect and use data as described there.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('4. Health Disclaimer', isMobile),
                      _buildParagraph(
                        'FoodZeen is not a medical app and does not provide professional medical advice. All recommendations and feedback are based on the information you provide and are intended for general wellness and educational purposes only.',
                        isMobile,
                      ),
                      const SizedBox(height: 12),
                      _buildParagraph(
                        'We encourage you to consult with a qualified healthcare provider before making any changes to your diet, exercise, or health routine.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('5. Changes to the App', isMobile),
                      _buildParagraph(
                        'We are constantly improving FoodZeen. That means features may change or be updated from time to time. We may also update these Terms when needed. When we do, we\'ll let you know via the app or by email.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('6. Your Data', isMobile),
                      _buildParagraph(
                        'You always own your data. You can delete your account at any time. If you delete your account, your personal data and history will be permanently removed from our systems unless required by law to retain it longer.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('7. Intellectual Property', isMobile),
                      _buildParagraph(
                        'The FoodZeen name, logo, design, and all content inside the app (unless uploaded by you) belong to FoodZeen or our trusted partners. Please don\'t copy, sell, or misuse any part of it.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('8. Account Suspension', isMobile),
                      _buildParagraph(
                        'We reserve the right to suspend or terminate access to the app if we find that someone is violating these Terms or using the service in a harmful or abusive way.',
                        isMobile,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('9. Contact Us', isMobile),
                      _buildParagraph(
                        'Have questions or concerns? We\'d love to help.',
                        isMobile,
                      ),
                      const SizedBox(height: 8),
                      _buildBulletList([
                        'Email: dimamamanov37@gmail.com',
                        'Address: Buyuk Ipak Yuli Street, 12, Tashkent',
                      ], isMobile),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          '© 2025 FoodZeen. All rights reserved.',
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text, bool isMobile) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: isMobile ? 20 : 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildParagraph(String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: isMobile ? 14 : 16,
          color: Colors.black87,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
