import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'contact_us_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_of_use_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;
  int? _expandedFaqIndex;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blurIntensity = (_scrollOffset / 100).clamp(0.0, 10.0);

    // Unified gradient colors
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
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            // App Bar with Blur Effect
            SliverAppBar(
              expandedHeight: 80,
              collapsedHeight: 70,
              pinned: true,
              floating: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 70,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurIntensity,
                      sigmaY: blurIntensity,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: SafeArea(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final isMobile = constraints.maxWidth < 600;
                            final textSize = isMobile ? 12.0 : 14.0;
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 16 : 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Logo
                                  Row(
                                    children: [
                                      Container(
                                        width: isMobile ? 36 : 40,
                                        height: isMobile ? 36 : 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              CupertinoColors.activeGreen,
                                              Color(0xFF4A90E2),
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'FZ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: isMobile ? 14 : 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: isMobile ? 8 : 12),
                                      Text(
                                        'FoodZeen',
                                        style: GoogleFonts.poppins(
                                          fontSize: isMobile ? 18 : 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Navigation Links
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ContactUsScreen(),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isMobile ? 4 : 8,
                                              vertical: 4,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          child: Text(
                                            'Contact Us',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: isMobile ? 10 : textSize,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TermsOfUseScreen(),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isMobile ? 4 : 8,
                                              vertical: 4,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          child: Text(
                                            'Terms',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: isMobile ? 10 : textSize,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PrivacyPolicyScreen(),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: isMobile ? 4 : 8,
                                              vertical: 4,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          child: Text(
                                            'Privacy',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black87,
                                              fontSize: isMobile ? 10 : textSize,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Hero Section
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 600;
                    final titleSize = isMobile ? 28.0 : 64.0;
                    final taglineSize = isMobile ? 16.0 : 18.0;
                    final horizontalPadding = isMobile ? 20.0 : 40.0;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          // Main Title
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Text(
                              'Every Single Day With FoodZeen',
                              style: GoogleFonts.poppins(
                                fontSize: titleSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: -1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Tagline
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Text(
                              'Track your calories, monitor your macros, and achieve your nutrition goals with personalized meal plans and verified nutrition data.',
                              style: GoogleFonts.poppins(
                                fontSize: taglineSize,
                                color: Colors.grey[700],
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: isMobile ? 40 : 60),
                          // App Store Buttons
                          isMobile
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildAppStoreButton(
                                      icon: Icons.apple,
                                      topText: 'Download on the',
                                      bottomText: 'App Store',
                                      onTap: () {},
                                      isMobile: true,
                                    ),
                                    const SizedBox(height: 16),
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          top: -8,
                                          right: -8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE91E63),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'Soon',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildAppStoreButton(
                                      icon: Icons.apple,
                                      topText: 'Download on the',
                                      bottomText: 'App Store',
                                      onTap: () {},
                                      isMobile: false,
                                    ),
                                  ],
                                ),
                        ],
                      );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 40)),

            // Loved by Thousands Section
            SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 600;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                      vertical: isMobile ? 60 : 0,
                    ),
                    child: Column(
                      children: [
                        // Main Heading
                        Text(
                          'Loved by thousands',
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 32 : 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        // Subheading
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 0,
                          ),
                          child: Text(
                            'Join 100,000+ people tracking smarter with AI',
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 16 : 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 60),
                        // Stats Cards
                        LayoutBuilder(
                          builder: (context, cardConstraints) {
                            if (cardConstraints.maxWidth > 800) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildLovedByCard(
                                    topText: '100K+',
                                    bottomText: 'Active Users',
                                  ),
                                  const SizedBox(width: 24),
                                  _buildLovedByCard(
                                    topText: '4.9★',
                                    bottomText: 'App Store Rating',
                                    showStar: true,
                                  ),
                                  const SizedBox(width: 24),
                                  _buildLovedByCard(
                                    topText: '1M+',
                                    bottomText: 'Meals Tracked',
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  _buildLovedByCard(
                                    topText: '100K+',
                                    bottomText: 'Active Users',
                                  ),
                                  const SizedBox(height: 24),
                                  _buildLovedByCard(
                                    topText: '4.9★',
                                    bottomText: 'App Store Rating',
                                    showStar: true,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildLovedByCard(
                                    topText: '1M+',
                                    bottomText: 'Meals Tracked',
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // FAQ Section
            SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 600;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                      vertical: isMobile ? 60 : 80,
                    ),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        // FAQ Title
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 0,
                          ),
                          child: Text(
                            'Frequently asked questions',
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 28 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 1.13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 60),
                        // FAQ Items
                        _buildFaqSection(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppStoreButton({
    required IconData icon,
    required String topText,
    required String bottomText,
    required VoidCallback onTap,
    bool isMobile = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 20,
          vertical: isMobile ? 10 : 12,
        ),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: isMobile ? 28 : 32),
            SizedBox(width: isMobile ? 10 : 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  topText,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: isMobile ? 9 : 10,
                  ),
                ),
                Text(
                  bottomText,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        if (isMobile) {
          return Column(
            children: [
              _buildFeatureCard(
                icon: Icons.calculate,
                title: 'Track Calories',
                description: 'Monitor your daily intake',
              ),
              const SizedBox(height: 20),
              _buildFeatureCard(
                icon: Icons.restaurant,
                title: 'Meal Plans',
                description: 'Personalized nutrition plans',
              ),
              const SizedBox(height: 20),
              _buildFeatureCard(
                icon: Icons.analytics,
                title: 'Progress',
                description: 'Track your nutrition goals',
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeatureCard(
              icon: Icons.calculate,
              title: 'Track Calories',
              description: 'Monitor your daily intake',
            ),
            _buildFeatureCard(
              icon: Icons.restaurant,
              title: 'Meal Plans',
              description: 'Personalized nutrition plans',
            ),
            _buildFeatureCard(
              icon: Icons.analytics,
              title: 'Progress',
              description: 'Track your nutrition goals',
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          width: isMobile ? double.infinity : 200,
          padding: EdgeInsets.all(isMobile ? 20 : 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: isMobile ? 40 : 48,
                color: const Color(0xFF6C63FF),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 13 : 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFaqSection() {
    final faqs = [
      {
        'question': 'How does FoodZeen work?',
        'answer':
            'FoodZeen calculates your ideal calorie and macronutrient intake, provides personalized meal plans, and allows you to log your meals and track your progress with verified nutrition data.\n\nWe support these features with additional tools like shopping lists, fasting tracking, and social features to keep you motivated and make your journey easier.',
      },
      {
        'question': 'Is FoodZeen free, or do I need a subscription?',
        'answer':
            'FoodZeen offers a free version with basic calorie tracking and meal logging features. Premium plans are available for advanced features like personalized meal plans, detailed nutrition analysis, shopping lists, and priority support.',
      },
      {
        'question': 'How do I upgrade to a premium plan?',
        'answer':
            'You can upgrade to a premium plan by tapping on the "Upgrade" button in the app settings or by visiting our website. Premium plans are available as monthly or annual subscriptions with various benefits including unlimited meal plans and advanced tracking features.',
      },
      {
        'question':
            'How does FoodZeen determine my calorie and macronutrient needs?',
        'answer':
            'FoodZeen uses advanced algorithms that consider your age, gender, height, weight, activity level, and fitness goals to calculate your personalized daily calorie and macronutrient requirements. The calculations are based on established nutritional science and can be adjusted based on your progress.',
      },
      {
        'question': 'Is FoodZeen\'s nutrition data verified?',
        'answer':
            'Yes, all nutrition data in FoodZeen is verified and regularly updated. We work with certified nutritionists and use reliable food databases to ensure accuracy. All calorie counts, macronutrient information, and nutritional values are cross-checked for accuracy.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 80.0),
          child: Column(
            children: List.generate(faqs.length, (index) {
              final faq = faqs[index];
              final isExpanded = _expandedFaqIndex == index;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _expandedFaqIndex = isExpanded ? null : index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              faq['question'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey[600],
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded)
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          faq['answer'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.grey[700],
                            height: 1.6,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  if (index < faqs.length - 1)
                    Divider(thickness: 0.5, color: Colors.grey[300]),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  Widget _buildLovedByCard({
    required String topText,
    required String bottomText,
    bool showStar = false,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          width: isMobile ? double.infinity : 280,
          padding: EdgeInsets.all(isMobile ? 24 : 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    topText,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 36 : 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  if (showStar)
                    Icon(
                      Icons.star,
                      color: Colors.grey[900],
                      size: isMobile ? 28 : 32,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                bottomText,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
