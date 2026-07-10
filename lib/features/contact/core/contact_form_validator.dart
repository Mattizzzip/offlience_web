class ContactFormValidator {
  const ContactFormValidator();

  static final RegExp _phonePattern = RegExp(
    r'^[\d\s+\-()]{7,20}$',
  );

  String? validateName(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return 'Please enter your name or organization';
    }
    if (text.length < 2) {
      return 'Name is too short';
    }
    return null;
  }

  String? validatePhone(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!_phonePattern.hasMatch(text)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateProjectDescription(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return 'Please describe your project';
    }
    if (text.length < 10) {
      return 'Please add a bit more detail about your project';
    }
    return null;
  }
}
