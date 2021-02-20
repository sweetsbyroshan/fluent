import 'dart:ui';

enum FluentSize {
  XSMALL,
  SMALL,
  MEDIUM,
  LARGE,
  XLARGE,
  XXLARGE,
}

extension FluentSizeExtension on FluentSize {
  Size get size {
    switch (this) {
      case FluentSize.XSMALL:
        return Size.square(20);
      case FluentSize.SMALL:
        return Size.square(24);
      case FluentSize.MEDIUM:
        return Size.square(32);
      case FluentSize.LARGE:
        return Size.square(40);
      case FluentSize.XLARGE:
        return Size.square(52);
      case FluentSize.XXLARGE:
        return Size.square(64);
      default:
        return null;
    }
  }

  void talk() {
    print('meow');
  }
}
