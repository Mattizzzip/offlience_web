import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FooterLegalLink extends StatefulWidget {
  const FooterLegalLink({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<FooterLegalLink> createState() => FooterLegalLinkState();
}

class FooterLegalLinkState extends State<FooterLegalLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            color: _hovered ? AppColors.gold : AppColors.steel,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: _hovered ? AppColors.gold : AppColors.steel,
          ),
        ),
      ),
    );
  }
}
