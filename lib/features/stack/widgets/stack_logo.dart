import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackLogo extends StatelessWidget {
  const StackLogo({super.key, required this.iconAsset});

  final String iconAsset;

  static const double size = 28;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        iconAsset,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
