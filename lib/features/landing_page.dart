import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/hero.dart';
import 'package:offlience_website/features/products/products.dart';
import 'package:offlience_website/features/stack/stack.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1400),
                    child: const Column(
                      children: [
                        HeroSection(),
                        SizedBox(height: 32),
                        StackSection(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              const ProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
