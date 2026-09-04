class LegalRoutes {
  LegalRoutes._();

  static const String privacyPolicy = '/privacy-policy';
  static const String terms = '/terms';
  static const String migraineTrackerPrivacyPolicy =
      '/migraine_tracker/privacy_policy';
  static const String migraineTrackerPrivacyPolicyRu =
      '/migraine_tracker/privacy_policy/ru';
  static const String migraineTrackerTermsOfUse =
      '/migraine_tracker/terms_of_use';
  static const String migraineTrackerTermsOfUseRu =
      '/migraine_tracker/terms_of_use/ru';

  static String normalize(String? name) {
    if (name == null || name.isEmpty) {
      return '/';
    }
    if (name.length > 1 && name.endsWith('/')) {
      return name.substring(0, name.length - 1);
    }
    return name;
  }
}
