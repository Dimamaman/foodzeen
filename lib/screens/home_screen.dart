import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // App Bar with Blur Effect
            SliverAppBar(
              expandedHeight: 100,
              collapsedHeight: 100,
              pinned: true,
              floating: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Logo
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          CupertinoColors.activeGreen,
                                          Color(0xFF4A90E2),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'FZ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'FoodZeen',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),

                              /// Navigation Links
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Contact Us',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Terms',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Privacy',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                height: MediaQuery.of(context).size.height * 0.85,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    // Faded background text
                    Positioned(
                      top: 100,
                      left: -50,
                      right: -50,
                      child: Opacity(
                        opacity: 0.1,
                        child: Text(
                          'Your Perfect Out',
                          style: GoogleFonts.poppins(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Main Content
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          // Main Title
                          Text(
                            'Every Single Day',
                            style: GoogleFonts.poppins(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: -1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          // Tagline
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Track your calories, monitor your macros, and achieve your nutrition goals with personalized meal plans and verified nutrition data.',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.grey[700],
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 60),
                          // App Store Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // App Store Button
                              _buildAppStoreButton(
                                icon: Icons.apple,
                                topText: 'Download on the',
                                bottomText: 'App Store',
                                onTap: () {},
                              ),
                              const SizedBox(width: 20),
                              // Google Play Button
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  _buildAppStoreButton(
                                    icon: Icons.android,
                                    topText: 'GET IT ON',
                                    bottomText: 'Google Play',
                                    onTap: () {},
                                  ),
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
                                        borderRadius: BorderRadius.circular(12),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Additional Content Sections with Blur Effect
            SliverToBoxAdapter(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurIntensity * 0.5,
                    sigmaY: blurIntensity * 0.5,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          'Features',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildFeatureSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Stats Section
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 100,
                ),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: gradientColors,
                //   ),
                // ),
                child: Column(
                  children: [
                    // Main Heading
                    Column(
                      children: [
                        Text(
                          'AI-Powered',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Calorie Counter & Diet Plans',
                          style: GoogleFonts.poppins(
                            fontSize: 64,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    // Stats Cards
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 700) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildStatCard(
                                topText: '10M+',
                                middleText: 'people worldwide',
                                bottomText: 'trust us',
                              ),
                              const SizedBox(width: 24),
                              _buildStatCard(
                                topText: '4.9',
                                middleText: 'out of 5 stars',
                                bottomText: '',
                                showStars: true,
                                showLaurel: true,
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              _buildStatCard(
                                topText: '10M+',
                                middleText: 'people worldwide',
                                bottomText: 'trust us',
                              ),
                              const SizedBox(height: 24),
                              _buildStatCard(
                                topText: '4.9',
                                middleText: 'out of 5 stars',
                                bottomText: '',
                                showStars: true,
                                showLaurel: true,
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Loved by Thousands Section
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 100,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFFFFE5F1), // Light pink
                      const Color(0xFFFFF8E1), // Light cream/yellow
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    // Main Heading
                    Text(
                      'Loved by thousands',
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Subheading
                    Text(
                      'Join 100,000+ people tracking smarter with AI',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    // Stats Cards
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 800) {
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
              ),
            ),
            // FAQ Section
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 80,
                ),
                color: Colors.transparent,
                child: Column(
                  children: [
                    // FAQ Title
                    Text(
                      'Frequently asked questions',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 1.13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    // FAQ Items
                    _buildFaqSection(),
                  ],
                ),
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
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  topText,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
                Text(
                  bottomText,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
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
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
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
          Icon(icon, size: 48, color: const Color(0xFF6C63FF)),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Column(
        children: List.generate(faqs.length, (index) {
          final faq = faqs[index];
          final isExpanded = _expandedFaqIndex == index;

          return Column(
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
                            fontSize: 18,
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
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      faq['answer'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
              if (index < faqs.length - 1)
                Divider(thickness: 0.5, color: Colors.grey[300]),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStatCard({
    required String topText,
    required String middleText,
    required String bottomText,
    bool showStars = false,
    bool showLaurel = false,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFBF7),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (showLaurel)
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.emoji_events,
                size: 60,
                color: Colors.grey[400],
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                topText,
                style: GoogleFonts.poppins(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFB8860B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                middleText,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              if (showStars) ...[
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: const Color(0xFFB8860B),
                      size: 24,
                    );
                  }),
                ),
              ],
              if (bottomText.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  bottomText,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLovedByCard({
    required String topText,
    required String bottomText,
    bool showStar = false,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(32),
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
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              if (showStar) Icon(Icons.star, color: Colors.grey[900], size: 32),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bottomText,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
