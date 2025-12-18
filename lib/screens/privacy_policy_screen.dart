import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isSmallScreen = screenWidth < 400;

    // Same gradient colors as home screen
    const gradientColors = [
      Color(0xFFD0E8FF),
      CupertinoColors.activeGreen,
      Colors.white,
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 12 : isMobile ? 16 : 24,
                  vertical: isSmallScreen ? 12 : 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: isSmallScreen ? 20 : 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Privacy Policy',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 16 : isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 12 : isMobile ? 16 : 40,
                    vertical: isSmallScreen ? 12 : 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 22 : isMobile ? 28 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Last Updated: Nov 25, 2025',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 12 : isMobile ? 14 : 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildParagraph(
                        'This Privacy Policy explains how FoodZeen ("we", "us", or "our") collects, uses, protects, and shares your information when you use the FoodZeen mobile application (the "App").',
                        isMobile,
                        isSmallScreen,
                      ),
                      _buildParagraph(
                        'By using the App, you agree to the practices described in this policy. If you don\'t agree, please don\'t use the app.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('1. What We Collect', isMobile, isSmallScreen),
                      const SizedBox(height: 12),
                      _buildSubHeading('1.1 Information You Provide', isMobile, isSmallScreen),
                      _buildParagraph(
                        'When you create an account or interact with features in the app, you may provide us with your name, email address, weight, goal weight, activity level, preferences, and other wellness-related details.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 12),
                      _buildSubHeading('1.2 Automatically Collected Data', isMobile, isSmallScreen),
                      _buildParagraph(
                        'We collect non-personal usage data like session duration, screen views, and anonymous device info to improve app performance and experience. This data doesn\'t directly identify you.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 12),
                      _buildSubHeading('1.3 Third-Party Analytics', isMobile, isSmallScreen),
                      _buildParagraph(
                        'We use trusted services like Firebase and Appsflyer to help us understand how the app is used. These services may collect anonymous usage, location, and demographic data.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('2. How We Use Your Data', isMobile, isSmallScreen),
                      const SizedBox(height: 12),
                      _buildBulletList([
                        'To personalize your health and nutrition insights',
                        'To provide and improve app features',
                        'To send reminders, motivational messages, and push notifications (only if you allow it)',
                        'To analyze overall usage and performance',
                      ], isMobile, isSmallScreen),
                      const SizedBox(height: 24),
                      _buildHeading('3. AI Processing', isMobile, isSmallScreen),
                      _buildParagraph(
                        'FoodZeen uses the OpenAI API to enhance features such as food photo analysis, calorie tracking, and nutritional suggestions. When you use these features, relevant inputs (like food images or text queries) may be sent securely to OpenAI for processing. We do not store this data permanently.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('4. Sharing Your Information', isMobile, isSmallScreen),
                      _buildParagraph(
                        'We do not sell your personal data. We only share it with:',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 8),
                      _buildBulletList([
                        'Service providers who help operate and maintain the app (e.g., database, analytics)',
                        'Legal authorities, if required by law',
                      ], isMobile, isSmallScreen),
                      const SizedBox(height: 24),
                      _buildHeading('5. Data Security', isMobile, isSmallScreen),
                      _buildParagraph(
                        'We use reasonable security measures to protect your data. However, no digital system is 100% secure. By using the app, you acknowledge this risk.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('6. Your Control', isMobile, isSmallScreen),
                      _buildParagraph(
                        'You can access, update, or delete your account and data at any time through the app. You can also turn off push notifications in your device settings.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('7. Updates to This Policy', isMobile, isSmallScreen),
                      _buildParagraph(
                        'We may revise this Privacy Policy from time to time. Changes will be posted in the app. Continued use means you accept the latest version.',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      _buildHeading('8. Contact', isMobile, isSmallScreen),
                      _buildParagraph(
                        'If you have any questions about this Privacy Policy, contact us at:',
                        isMobile,
                        isSmallScreen,
                      ),
                      const SizedBox(height: 8),
                      _buildBulletList([
                        'Email: dimamamanov37@gmail.com',
                        'Address: Buyuk Ipak Yuli Street, 12, Tashkent',
                      ], isMobile, isSmallScreen),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          '© 2025, FoodZeen. All rights reserved.',
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

  Widget _buildHeading(String text, bool isMobile, bool isSmallScreen) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: isSmallScreen ? 18 : isMobile ? 20 : 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSubHeading(String text, bool isMobile, bool isSmallScreen) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: isSmallScreen ? 14 : isMobile ? 16 : 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildParagraph(String text, bool isMobile, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: isSmallScreen ? 12 : isMobile ? 14 : 16,
          color: Colors.black87,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items, bool isMobile, bool isSmallScreen) {
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
                  fontSize: isSmallScreen ? 12 : isMobile ? 14 : 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: GoogleFonts.poppins(
                    fontSize: isSmallScreen ? 12 : isMobile ? 14 : 16,
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
