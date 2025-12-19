import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isSubmitting = false;

  // Telegram Bot API configuration
  // Replace with your actual bot token and chat ID
  static const String _telegramApiUrl =
      'https://api.telegram.org/bot8319773196:AAE6fprYnhNfWqO0kLZRGrf0TCsHPIIZJLE/sendMessage';
  static const String _chatId =
      '-1003123619749'; // Your Telegram chat ID or channel username

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_updateButtonState);
    _nameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _isFormValid {
    return _nameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _messageController.text.trim().isNotEmpty;
  }

  void _handleSubmit() {
    if (!_isFormValid || _isSubmitting) return;
    _sendMessage();
  }

  Future<void> _sendMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (message.isNotEmpty && !_isSubmitting) {
      setState(() {
        _isSubmitting = true;
      });

      await Future.delayed(Duration(milliseconds: 300));

      try {
        // Get user info and device metadata
        final userInfo = await _getUserInfo();
        final deviceMetadata = await _getDeviceMetadata();

        // Format the message with user info and metadata
        final formattedMessage = _formatSupportMessage(
          name: name,
          email: email,
          message: message,
          userInfo: userInfo,
          metadata: deviceMetadata,
        );

        final dio = Dio();
        final response = await dio.post(
          _telegramApiUrl,
          data: {
            'chat_id': _chatId,
            'text': formattedMessage,
            'parse_mode': 'HTML',
          },
        );

        if (response.statusCode == 200) {
          final responseData = response.data;
          if (responseData['ok'] == true) {
            if (mounted) {
              _nameController.clear();
              _emailController.clear();
              _messageController.clear();
            }
          } else {
            if (mounted) {
              _showErrorDialog(
                'Failed to send message: ${responseData['description']}',
              );
            }
          }
        } else {
          if (mounted) {
            _showErrorDialog('Network error: ${response.statusCode}');
          }
        }
      } catch (e) {
        if (mounted) {
          _showErrorDialog('Error: $e');
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  Future<Map<String, String>> _getUserInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return {
        'app_name': packageInfo.appName,
        'app_version': packageInfo.version,
        'package_name': packageInfo.packageName,
        'build_number': packageInfo.buildNumber,
      };
    } catch (e) {
      return {'error': 'Could not get app info: $e'};
    }
  }

  Future<Map<String, String>> _getDeviceMetadata() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      Map<String, String> metadata = {};

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        metadata = {
          'platform': 'Android',
          'device': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
          'android_version': androidInfo.version.release,
          'sdk_version': androidInfo.version.sdkInt.toString(),
        };
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        metadata = {
          'platform': 'iOS',
          'device': iosInfo.model,
          'device_name': iosInfo.name,
          'ios_version': iosInfo.systemVersion,
          'identifier': iosInfo.identifierForVendor ?? 'Unknown',
        };
      } else {
        metadata = {'platform': Platform.operatingSystem};
      }

      return metadata;
    } catch (e) {
      return {'error': 'Could not get device info: $e'};
    }
  }

  String _formatSupportMessage({
    required String name,
    required String email,
    required String message,
    required Map<String, String> userInfo,
    required Map<String, String> metadata,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('<b>📧 New Contact From Website</b>\n');
    buffer.writeln('<b>Name:</b> $name');
    buffer.writeln('<b>Email:</b> $email\n');
    buffer.writeln('<b>Message:</b>');
    buffer.writeln(message);
    buffer.writeln('\n<b>📱 Device Information:</b>');

    metadata.forEach((key, value) {
      buffer.writeln('• <b>$key:</b> $value');
    });

    buffer.writeln('\n<b>📦 App Information:</b>');
    userInfo.forEach((key, value) {
      buffer.writeln('• <b>$key:</b> $value');
    });

    buffer.writeln('\n<b>🕐 Time:</b> ${DateTime.now().toIso8601String()}');

    return buffer.toString();
  }

  void _showSuccessDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Success'),
        content: const Text(
          'Thank you for your message! We\'ll get back to you soon.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String errorMessage) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen
                      ? 12
                      : isMobile
                      ? 16
                      : 24,
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
                        'Contact Us',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen
                              ? 16
                              : isMobile
                              ? 20
                              : 24,
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
                    horizontal: isSmallScreen
                        ? 12
                        : isMobile
                        ? 16
                        : 40,
                    vertical: isSmallScreen ? 12 : 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Form
                      Text(
                        'Send us a message',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen
                              ? 18
                              : isMobile
                              ? 20
                              : 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Name Field
                      _buildTextField(
                        controller: _nameController,
                        label: 'Your Name',
                        hint: 'Enter your name',
                        icon: Icons.person,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      _buildTextField(
                        controller: _emailController,
                        label: 'Your Email',
                        hint: 'Enter your email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 16),
                      // Message Field
                      _buildTextField(
                        controller: _messageController,
                        label: 'Message',
                        hint: 'Enter your message',
                        icon: Icons.message,
                        maxLines: 6,
                        isMobile: isMobile,
                      ),
                      SizedBox(height: isSmallScreen ? 24 : 32),
                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          onPressed: _isFormValid && !_isSubmitting
                              ? _handleSubmit
                              : null,
                          color: _isSubmitting
                              ? CupertinoColors.activeGreen.withOpacity(0.7)
                              : _isFormValid
                              ? CupertinoColors.activeGreen
                              : CupertinoColors.inactiveGray,
                          borderRadius: BorderRadius.circular(12),
                          padding: EdgeInsets.symmetric(
                            vertical: isSmallScreen
                                ? 14
                                : isMobile
                                ? 16
                                : 18,
                          ),
                          minSize: isSmallScreen ? 44 : 48,
                          child: _isSubmitting
                              ? const CupertinoActivityIndicator(
                                  color: CupertinoColors.white,
                                  radius: 10,
                                )
                              : Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(
                                    fontSize: isSmallScreen
                                        ? 14
                                        : isMobile
                                        ? 16
                                        : 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isMobile = false,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12 : 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.separator, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 4,
              top: isSmallScreen ? 6 : 8,
              bottom: 4,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: CupertinoColors.activeGreen,
                  size: isSmallScreen
                      ? 16
                      : isMobile
                      ? 18
                      : 20,
                ),
                SizedBox(width: isSmallScreen ? 6 : 8),
                Flexible(
                  child: Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: isSmallScreen
                          ? 11
                          : isMobile
                          ? 12
                          : 14,
                      color: CupertinoColors.secondaryLabel,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            minLines: maxLines > 1 ? maxLines : 1,
            placeholder: hint,
            placeholderStyle: GoogleFonts.poppins(
              fontSize: isSmallScreen
                  ? 12
                  : isMobile
                  ? 14
                  : 16,
              color: CupertinoColors.placeholderText,
            ),
            style: GoogleFonts.poppins(
              fontSize: isSmallScreen
                  ? 12
                  : isMobile
                  ? 14
                  : 16,
              color: CupertinoColors.label,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: isSmallScreen ? 10 : 12,
            ),
            decoration: const BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
