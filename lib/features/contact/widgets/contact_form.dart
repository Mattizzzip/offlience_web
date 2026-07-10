import 'package:flutter/material.dart';
import 'package:offlience_website/features/contact/core/contact_catalog.dart';
import 'package:offlience_website/features/contact/core/contact_form_data.dart';
import 'package:offlience_website/features/contact/core/contact_form_validator.dart';
import 'package:offlience_website/features/contact/core/contact_mail_service.dart';
import 'package:offlience_website/features/contact/widgets/contact_consent_checkbox.dart';
import 'package:offlience_website/features/contact/widgets/contact_submit_button.dart';
import 'package:offlience_website/features/contact/widgets/contact_text_field.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    super.key,
    this.mailService = const ContactMailService(),
    this.validator = const ContactFormValidator(),
  });

  final ContactMailService mailService;
  final ContactFormValidator validator;

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();

  bool _isSubmitting = false;
  bool _consentAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _projectController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    final form = _formKey.currentState;
    if (!_consentAccepted || form == null || !form.validate()) return;

    setState(() => _isSubmitting = true);

    final data = ContactFormData(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      projectDescription: _projectController.text.trim(),
    );

    final opened = await widget.mailService.send(data);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          opened
              ? 'Your email app is ready — just press Send.'
              : 'Could not open the email app. Please write to info@offlience.com',
        ),
        backgroundColor: opened ? AppColors.navy : AppColors.slate,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 720;
    final canSubmit = _consentAccepted && !_isSubmitting;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 720),
      padding: EdgeInsets.all(isCompact ? 20 : 28),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(isCompact ? 24 : 32),
        border: Border.all(color: AppColors.heroBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.midnight.withValues(alpha: 0.06),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContactTextField(
              controller: _nameController,
              label: ContactCatalog.nameLabel,
              validator: widget.validator.validateName,
            ),
            const SizedBox(height: 16),
            ContactTextField(
              controller: _phoneController,
              label: ContactCatalog.phoneLabel,
              keyboardType: TextInputType.phone,
              validator: widget.validator.validatePhone,
            ),
            const SizedBox(height: 16),
            ContactTextField(
              controller: _projectController,
              label: ContactCatalog.projectLabel,
              keyboardType: TextInputType.multiline,
              maxLines: isCompact ? 5 : 6,
              validator: widget.validator.validateProjectDescription,
            ),
            const SizedBox(height: 20),
            ContactConsentCheckbox(
              value: _consentAccepted,
              onChanged: (value) => setState(() => _consentAccepted = value),
            ),
            const SizedBox(height: 20),
            ContactSubmitButton(
              label: ContactCatalog.submitLabel,
              isLoading: _isSubmitting,
              onPressed: canSubmit ? _onSubmit : null,
            ),
          ],
        ),
      ),
    );
  }
}
