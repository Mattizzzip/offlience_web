import 'package:flutter/material.dart';

class MouseTracker {
  Offset position = Offset.zero;
  bool isInside = false;

  void track(Offset localPosition) {
    position = localPosition;
    isInside = true;
  }

  void reset() {
    isInside = false;
  }
}
