part of 'effects.dart';

extension RadiusExtension on num {
  Radius get rc => () {
        return Radius.circular(toDouble());
      }();

  BorderRadius get brc => () {
        return BorderRadius.circular(toDouble());
      }();

  Radius re(num? y) {
    return Radius.elliptical(toDouble(), y?.toDouble() ?? toDouble());
  }
}
