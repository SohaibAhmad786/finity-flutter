part of 'position.dart';

extension PositionExtension on Widget {
  Widget position({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      key: key,
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      height: height,
      width: width,
      child: this,
    );
  }

  Widget positionFill({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Positioned.fill(
      key: key,
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: this,
    );
  }
}
