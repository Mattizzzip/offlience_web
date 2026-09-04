import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalRichText extends StatelessWidget {
  const LegalRichText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.textMuted,
    this.fontWeight = FontWeight.w400,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  static final _tokenPattern = RegExp(
    r'\*\*(.+?)\*\*|\[([^\]]+)\]\(([^)]+)\)',
  );

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(children: _parse(text)),
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1.65,
      ),
    );
  }

  List<InlineSpan> _parse(String source) {
    final spans = <InlineSpan>[];
    var cursor = 0;

    for (final match in _tokenPattern.allMatches(source)) {
      if (match.start > cursor) {
        spans.add(TextSpan(text: source.substring(cursor, match.start)));
      }

      final bold = match.group(1);
      if (bold != null) {
        spans.add(
          TextSpan(
            text: bold,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      } else {
        final label = match.group(2)!;
        final url = match.group(3)!;
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _LegalLink(label: label, url: url, fontSize: fontSize),
          ),
        );
      }

      cursor = match.end;
    }

    if (cursor < source.length) {
      spans.add(TextSpan(text: source.substring(cursor)));
    }

    return spans;
  }
}

class _LegalLink extends StatelessWidget {
  const _LegalLink({
    required this.label,
    required this.url,
    required this.fontSize,
  });

  final String label;
  final String url;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final uri = Uri.tryParse(url);
          if (uri != null) {
            launchUrl(uri, webOnlyWindowName: '_blank');
          }
        },
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.navy,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            height: 1.65,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.navy,
          ),
        ),
      ),
    );
  }
}
