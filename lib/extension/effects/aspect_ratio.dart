part of 'effects.dart';

extension AspectRatioExtension on Widget {
  Widget aspectRatio({
    Key? key,
    required double aspectRatio,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      key: key,
      child: this,
    );
  }
}

extension AspectRatioSizeExtension on num {
  Size aspectR(double aspectRation, [bool isWidth = true]) {
    if (isWidth) {
      return Size(toDouble(), toDouble() * aspectRation);
    }
    return Size(toDouble() * aspectRation, toDouble());
  }
}
