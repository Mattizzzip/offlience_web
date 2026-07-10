import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class ContactSubmitButton extends StatefulWidget {
  const ContactSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  State<ContactSubmitButton> createState() => ContactSubmitButtonState();
}

class ContactSubmitButtonState extends State<ContactSubmitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null && !widget.isLoading;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: enabled ? widget.onPressed : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: !enabled
                ? AppColors.slate
                : _hovered
                    ? AppColors.buttonPrimaryHover
                    : AppColors.buttonPrimary,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.midnight.withValues(
                  alpha: enabled && _hovered ? 0.16 : 0.1,
                ),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.buttonPrimaryText,
                    ),
                  )
                : Text(
                    widget.label,
                    style: const TextStyle(
                      color: AppColors.buttonPrimaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
