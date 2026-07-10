import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class StackFadeOverlay extends StatelessWidget {
  const StackFadeOverlay({super.key});

  static const double _fadeWidth = 120;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: _fadeWidth,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.background,
                    Color(0x00D1D2D9),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: _fadeWidth,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    AppColors.background,
                    Color(0x00D1D2D9),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
