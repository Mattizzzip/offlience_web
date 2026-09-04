import 'package:flutter_test/flutter_test.dart';
import 'package:offlience_website/features/app_router.dart';
import 'package:offlience_website/features/landing_page.dart';
import 'package:offlience_website/features/legal/core/legal_routes.dart';
import 'package:offlience_website/features/legal/migraine_tracker_privacy_policy_page.dart';
import 'package:offlience_website/features/legal/migraine_tracker_terms_of_use_page.dart';
import 'package:offlience_website/features/legal/privacy_policy_page.dart';
import 'package:offlience_website/features/legal/terms_of_service_page.dart';

void main() {
  test('AppRouter maps legal paths, including trailing slashes', () {
    expect(AppRouter.pageFor('/'), isA<LandingPage>());
    expect(AppRouter.pageFor(LegalRoutes.privacyPolicy), isA<PrivacyPolicyPage>());
    expect(AppRouter.pageFor(LegalRoutes.terms), isA<TermsOfServicePage>());
    expect(
      AppRouter.pageFor(LegalRoutes.migraineTrackerPrivacyPolicy),
      isA<MigraineTrackerPrivacyPolicyPage>(),
    );
    expect(
      AppRouter.pageFor('${LegalRoutes.migraineTrackerPrivacyPolicy}/'),
      isA<MigraineTrackerPrivacyPolicyPage>(),
    );
    expect(
      AppRouter.pageFor(LegalRoutes.migraineTrackerTermsOfUse),
      isA<MigraineTrackerTermsOfUsePage>(),
    );
    expect(
      AppRouter.pageFor('${LegalRoutes.migraineTrackerTermsOfUse}/'),
      isA<MigraineTrackerTermsOfUsePage>(),
    );
    expect(
      (AppRouter.pageFor(LegalRoutes.migraineTrackerPrivacyPolicyRu)
              as MigraineTrackerPrivacyPolicyPage)
          .russian,
      isTrue,
    );
    expect(
      (AppRouter.pageFor('${LegalRoutes.migraineTrackerTermsOfUseRu}/')
              as MigraineTrackerTermsOfUsePage)
          .russian,
      isTrue,
    );
  });
}
