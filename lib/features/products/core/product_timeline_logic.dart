class ProductTimelineLogic {
  const ProductTimelineLogic();

  int nextIndex(int current, int length) {
    if (length <= 0) return 0;
    return (current + 1) % length;
  }

  int indexForProgress(double progress, int length) {
    if (length <= 1) return 0;

    final step = 1 / (length - 1);
    final index = (progress / step).round();
    return index.clamp(0, length - 1);
  }

  double progressForIndex(int index, int length) {
    if (length <= 1) return 0;
    return index / (length - 1);
  }
}
