import 'package:flutter/material.dart';
import 'package:offlience_website/features/footer/core/footer_catalog.dart';
import 'package:offlience_website/features/footer/widgets/footer_legal_detail_row.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FooterLegalDetails extends StatelessWidget {
  const FooterLegalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.midnight.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.steel.withValues(alpha: 0.2),
        ),
      ),
      child: const SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              FooterCatalog.legalEntityName,
              style: TextStyle(
                color: AppColors.lavender,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
                height: 1.3,
              ),
            ),
            SizedBox(height: 16),
            FooterLegalDetailRow(
              label: FooterCatalog.businessIdLabel,
              value: FooterCatalog.businessId,
            ),
            FooterLegalDetailRow(
              label: FooterCatalog.countryLabel,
              value: FooterCatalog.country,
            ),
            FooterLegalDetailRow(
              label: FooterCatalog.addressLabel,
              value: FooterCatalog.legalAddress,
            ),
          ],
        ),
      ),
    );
  }
}
