import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class DiscoverButton extends StatefulWidget {
  const DiscoverButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<DiscoverButton> createState() => DiscoverButtonState();
}

class DiscoverButtonState extends State<DiscoverButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.buttonPrimaryHover
                : AppColors.buttonPrimary,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.midnight.withValues(
                  alpha: _hovered ? 0.16 : 0.1,
                ),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Text(
            'Discover more',
            style: TextStyle(
              color: AppColors.buttonPrimaryText,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
