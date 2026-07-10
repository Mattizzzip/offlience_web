import 'package:flutter/material.dart';

/// Disables descendant [Ticker]s while this widget is off-screen.
class VisibilityTickerMode extends StatefulWidget {
  const VisibilityTickerMode({super.key, required this.child});

  final Widget child;

  @override
  State<VisibilityTickerMode> createState() => _VisibilityTickerModeState();
}

class _VisibilityTickerModeState extends State<VisibilityTickerMode> {
  ScrollPosition? _position;
  bool _visible = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final next = Scrollable.maybeOf(context)?.position;
    if (!identical(_position, next)) {
      _position?.removeListener(_onScroll);
      _position = next;
      _position?.addListener(_onScroll);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateVisibility());
  }

  @override
  void dispose() {
    _position?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() => _updateVisibility();

  void _updateVisibility() {
    if (!mounted) return;

    final box = context.findRenderObject();
    if (box is! RenderBox || !box.hasSize) return;

    final topLeft = box.localToGlobal(Offset.zero);
    final bottom = topLeft.dy + box.size.height;
    final height = MediaQuery.sizeOf(context).height;

    // Keep tickers warm slightly before entering the viewport.
    const margin = 120.0;
    final visible = bottom > -margin && topLeft.dy < height + margin;

    if (visible != _visible) {
      setState(() => _visible = visible);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TickerMode(
      enabled: _visible,
      child: widget.child,
    );
  }
}
