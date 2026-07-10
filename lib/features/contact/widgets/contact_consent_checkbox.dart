import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:offlience_website/features/contact/core/contact_catalog.dart';
import 'package:offlience_website/features/legal/core/legal_routes.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class ContactConsentCheckbox extends StatefulWidget {
  const ContactConsentCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<ContactConsentCheckbox> createState() => ContactConsentCheckboxState();
}

class ContactConsentCheckboxState extends State<ContactConsentCheckbox> {
  late final TapGestureRecognizer _privacyRecognizer;
  late final TapGestureRecognizer _termsRecognizer;

  @override
  void initState() {
    super.initState();
    _privacyRecognizer = TapGestureRecognizer();
    _termsRecognizer = TapGestureRecognizer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _privacyRecognizer.onTap = () {
      Navigator.of(context).pushNamed(LegalRoutes.privacyPolicy);
    };
    _termsRecognizer.onTap = () {
      Navigator.of(context).pushNamed(LegalRoutes.terms);
    };
  }

  @override
  void dispose() {
    _privacyRecognizer.dispose();
    _termsRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: widget.value,
            onChanged: (checked) => widget.onChanged(checked ?? false),
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.navy;
              }
              return Colors.transparent;
            }),
            checkColor: AppColors.lavender,
            side: BorderSide(
              color: AppColors.steel.withValues(alpha: 0.8),
              width: 1.4,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 13,
                height: 1.45,
              ),
              children: [
                const TextSpan(text: ContactCatalog.consentPrefix),
                TextSpan(
                  text: ContactCatalog.privacyPolicyLabel,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: _privacyRecognizer,
                ),
                const TextSpan(text: ContactCatalog.consentConnector),
                TextSpan(
                  text: ContactCatalog.termsLabel,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: _termsRecognizer,
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
