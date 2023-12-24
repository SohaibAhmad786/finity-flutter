import 'dart:math';

import 'package:number_interpolation/number_interpolation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension NullDouble on double? {
  double get def => () {
        return this ?? 0.0;
      }();
}

extension SizerHelper on num {
  double cl(
    int lowerLimit,
    int upperLimit,
  ) {
    return sp.clamp(lowerLimit, upperLimit).toDouble();
  }

  double cw(
    int lowerLimit,
    int upperLimit,
  ) {
    return w.clamp(lowerLimit, upperLimit).toDouble();
  }

  double ch(
    int lowerLimit,
    int upperLimit,
  ) {
    return h.clamp(lowerLimit, upperLimit).toDouble();
  }

  num minM(num minimum) {
    return min(this, minimum);
  }

  double interpolate({
    required List<num> inputRange,
    required List<num> outputRange,
  }) {
    final interpolate =
        createInterpolation(inputRange: inputRange, outputRange: outputRange);
    return interpolate(this);
  }

  num add(num val) {
    return this + val;
  }

  num minus(num val) {
    return this - val;
  }

  double divide(num val) {
    return this / val;
  }

  num times(num val) {
    return this * val;
  }
}
