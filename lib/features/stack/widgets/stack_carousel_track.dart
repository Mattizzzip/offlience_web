import 'package:flutter/material.dart';
import 'package:offlience_website/features/stack/core/carousel_scroll_logic.dart';
import 'package:offlience_website/features/stack/core/stack_technology.dart';
import 'package:offlience_website/features/stack/widgets/stack_item.dart';

class StackCarouselTrack extends StatefulWidget {
  const StackCarouselTrack({
    super.key,
    required this.technologies,
    required this.controller,
    required this.scrollLogic,
  });

  final List<StackTechnology> technologies;
  final AnimationController controller;
  final CarouselScrollLogic scrollLogic;

  @override
  State<StackCarouselTrack> createState() => StackCarouselTrackState();
}

class StackCarouselTrackState extends State<StackCarouselTrack> {
  final GlobalKey _measureKey = GlobalKey();
  double _singleSetWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureTrack());
  }

  @override
  void didUpdateWidget(covariant StackCarouselTrack oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureTrack());
  }

  void _measureTrack() {
    final context = _measureKey.currentContext;
    if (context == null) return;

    final width = context.size?.width ?? 0;
    if (width > 0 && (width - _singleSetWidth).abs() > 0.5) {
      setState(() => _singleSetWidth = width);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: AnimatedBuilder(
                animation: widget.controller,
                builder: (context, child) {
                  final offset = widget.scrollLogic.offsetForProgress(
                    widget.controller.value,
                    _singleSetWidth,
                  );

                  return Transform.translate(
                    offset: Offset(-offset, 0),
                    child: child,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    CarouselScrollLogic.repeatCount,
                    (copyIndex) => _buildItemSet(
                      key: copyIndex == 0 ? _measureKey : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemSet({Key? key}) {
    return Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: widget.technologies
          .map(
            (technology) => StackItem(
              technology: technology,
              spacing: CarouselScrollLogic.itemSpacing,
            ),
          )
          .toList(),
    );
  }
}
