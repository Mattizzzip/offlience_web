class CarouselScrollLogic {
  const CarouselScrollLogic();

  /// Total horizontal gap between adjacent stack items.
  static const double itemSpacing = 88;

  /// How many identical item sets are laid out in a row.
  static const int repeatCount = 3;

  double offsetForProgress(double progress, double singleSetWidth) {
    if (singleSetWidth <= 0) return 0;
    return progress * singleSetWidth;
  }
}
