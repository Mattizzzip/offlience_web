import 'package:flutter/material.dart';
import 'package:offlience_website/features/products/core/product.dart';
import 'package:offlience_website/features/products/core/product_timeline_logic.dart';
import 'package:offlience_website/features/products/core/timeline_photon_painter.dart';
import 'package:offlience_website/features/products/widgets/product_timeline_node.dart';

class ProductTimelineRail extends StatefulWidget {
  const ProductTimelineRail({
    super.key,
    required this.products,
    required this.activeIndex,
    required this.onItemSelected,
    required this.height,
  });

  final List<Product> products;
  final int activeIndex;
  final ValueChanged<int> onItemSelected;
  final double height;

  @override
  State<ProductTimelineRail> createState() => ProductTimelineRailState();
}

class ProductTimelineRailState extends State<ProductTimelineRail>
    with SingleTickerProviderStateMixin {
  static const double _railWidth = 24;
  static const double _maxNodeExtent = 12;
  static const Duration _cycleDuration = Duration(milliseconds: 5600);

  final ProductTimelineLogic _logic = const ProductTimelineLogic();
  late final AnimationController _photonController;
  bool _movingDown = true;
  int _lastReportedIndex = 0;

  double get _trackInset => _maxNodeExtent / 2 + 10;

  @override
  void initState() {
    super.initState();
    _lastReportedIndex = widget.activeIndex;
    _photonController = AnimationController(
      vsync: this,
      duration: _cycleDuration,
      value: _logic.progressForIndex(widget.activeIndex, widget.products.length),
    )..repeat(reverse: true);

    _photonController.addListener(_onPhotonTick);
    _photonController.addStatusListener(_onPhotonStatus);
  }

  @override
  void didUpdateWidget(covariant ProductTimelineRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeIndex != widget.activeIndex &&
        widget.activeIndex != _lastReportedIndex) {
      _photonController.value = _logic.progressForIndex(
        widget.activeIndex,
        widget.products.length,
      );
      _lastReportedIndex = widget.activeIndex;
    }
  }

  @override
  void dispose() {
    _photonController
      ..removeListener(_onPhotonTick)
      ..removeStatusListener(_onPhotonStatus)
      ..dispose();
    super.dispose();
  }

  void _onPhotonStatus(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      setState(() => _movingDown = true);
    } else if (status == AnimationStatus.reverse) {
      setState(() => _movingDown = false);
    }
  }

  void _onPhotonTick() {
    final index = _logic.indexForProgress(
      _photonController.value,
      widget.products.length,
    );

    if (index != _lastReportedIndex) {
      _lastReportedIndex = index;
      widget.onItemSelected(index);
    }
  }

  void _onNodeTap(int index) {
    _lastReportedIndex = index;
    widget.onItemSelected(index);
    _photonController.animateTo(
      _logic.progressForIndex(index, widget.products.length),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _railWidth,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _photonController,
        builder: (context, child) {
          return CustomPaint(
            painter: TimelinePhotonPainter(
              progress: _photonController.value,
              movingDown: _movingDown,
              trackInset: _trackInset,
            ),
            child: child,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var i = 0; i < widget.products.length; i++)
              Positioned(
                top: _nodeCenterY(i) - _maxNodeExtent / 2,
                left: _railWidth / 2 - _maxNodeExtent / 2,
                child: ProductTimelineNode(
                  isActive: i == widget.activeIndex,
                  onTap: () => _onNodeTap(i),
                ),
              ),
          ],
        ),
      ),
    );
  }

  double _nodeCenterY(int index) {
    final trackTop = _trackInset;
    final trackBottom = widget.height - _trackInset;

    if (widget.products.length <= 1) {
      return widget.height / 2;
    }

    final fraction = index / (widget.products.length - 1);
    return trackTop + fraction * (trackBottom - trackTop);
  }
}
