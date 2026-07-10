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
    required this.extent,
    this.axis = Axis.vertical,
  });

  final List<Product> products;
  final int activeIndex;
  final ValueChanged<int> onItemSelected;
  final double extent;
  final Axis axis;

  @override
  State<ProductTimelineRail> createState() => ProductTimelineRailState();
}

class ProductTimelineRailState extends State<ProductTimelineRail>
    with SingleTickerProviderStateMixin {
  static const double _railThickness = 24;
  static const double _maxNodeExtent = 12;
  static const Duration _cycleDuration = Duration(milliseconds: 5600);

  final ProductTimelineLogic _logic = const ProductTimelineLogic();
  late final AnimationController _photonController;
  bool _movingForward = true;
  int _lastReportedIndex = 0;

  double get _trackInset => _maxNodeExtent / 2 + 10;
  bool get _isVertical => widget.axis == Axis.vertical;

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
      setState(() => _movingForward = true);
    } else if (status == AnimationStatus.reverse) {
      setState(() => _movingForward = false);
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
      width: _isVertical ? _railThickness : widget.extent,
      height: _isVertical ? widget.extent : _railThickness,
      child: AnimatedBuilder(
        animation: _photonController,
        builder: (context, child) {
          return CustomPaint(
            painter: TimelinePhotonPainter(
              progress: _photonController.value,
              movingForward: _movingForward,
              trackInset: _trackInset,
              axis: widget.axis,
            ),
            child: child,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var i = 0; i < widget.products.length; i++)
              Positioned(
                top: _isVertical
                    ? _nodeCenter(i) - _maxNodeExtent / 2
                    : _railThickness / 2 - _maxNodeExtent / 2,
                left: _isVertical
                    ? _railThickness / 2 - _maxNodeExtent / 2
                    : _nodeCenter(i) - _maxNodeExtent / 2,
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

  double _nodeCenter(int index) {
    final trackStart = _trackInset;
    final trackEnd = widget.extent - _trackInset;

    if (widget.products.length <= 1) {
      return widget.extent / 2;
    }

    final fraction = index / (widget.products.length - 1);
    return trackStart + fraction * (trackEnd - trackStart);
  }
}
