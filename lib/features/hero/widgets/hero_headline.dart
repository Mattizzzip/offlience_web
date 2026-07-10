import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class HeroHeadline extends StatelessWidget {
  const HeroHeadline({super.key, required this.isCompact});

  final bool isCompact;

  static const headline =
      'Building Next-Gen Software and Mobile Apps Powered by '
      'Offline Intelligence and Advanced Technologies.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isCompact ? 24 : 48),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Text(
          headline,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isCompact ? 28 : 42,
            fontWeight: FontWeight.w600,
            height: 1.15,
            letterSpacing: -0.8,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
