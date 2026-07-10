import 'package:flutter/material.dart';
import 'package:offlience_website/features/shared/widgets/visibility_ticker_mode.dart';
import 'package:offlience_website/features/stack/core/carousel_scroll_logic.dart';
import 'package:offlience_website/features/stack/core/stack_catalog.dart';
import 'package:offlience_website/features/stack/widgets/stack_carousel_track.dart';
import 'package:offlience_website/features/stack/widgets/stack_fade_overlay.dart';

class StackSection extends StatefulWidget {
  const StackSection({super.key});

  @override
  State<StackSection> createState() => StackSectionState();
}

class StackSectionState extends State<StackSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scrollController;
  final CarouselScrollLogic _scrollLogic = const CarouselScrollLogic();

  @override
  void initState() {
    super.initState();
    _scrollController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 28),
    )..repeat();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityTickerMode(
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: RepaintBoundary(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.expand,
            children: [
              StackCarouselTrack(
                technologies: StackCatalog.technologies,
                controller: _scrollController,
                scrollLogic: _scrollLogic,
              ),
              const StackFadeOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
