import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const Spacer(),

              //---------------------------------
              // Logo
              //---------------------------------

              Image.asset(
                "assets/images/alu_logo.png",
                height: 90,
              ),

              const SizedBox(height: 20),

              const Text(
                "ALU Connect+",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Connect. Collaborate. Build Impact.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 30),

              //---------------------------------
              // Hero Image
              //---------------------------------

              Expanded(
                flex: 3,
                child: Image.asset(
                  "assets/images/students.jpg",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 25),

              //---------------------------------
              // Features
              //---------------------------------

              const FeatureItem(
                icon: Icons.event_available,
                text: "Discover Opportunities",
              ),

              const SizedBox(height: 12),

              const FeatureItem(
                icon: Icons.groups,
                text: "Join Communities",
              ),

              const SizedBox(height: 12),

              const FeatureItem(
                icon: Icons.rocket_launch,
                text: "Build Your Network",
              ),

              const Spacer(),

              //---------------------------------
              // Button
              //---------------------------------

              CustomButton(
                text: "Get Started",
                onPressed: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BottomNav(),
                    ),
                  );

                },
              ),

              const SizedBox(height: 20),

              const Text(
                "Built for ALU Students",
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Icon(
          icon,
          color: AppColors.primary,
        ),

        const SizedBox(width: 12),

        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}