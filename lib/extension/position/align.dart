part of 'position.dart';

extension AlignPosition on Widget {
  ///
  /// Wraps widget with the align widget from materials
  Widget align({
    required AlignmentGeometry alignment,

    /// If non-null, sets its height to the child's height multiplied by this factor.
    /// Can be both greater and less than 1.0 but must be non-negative
    double? hFactor,
    double? wFactor,
  }) {
    return Align(
      alignment: alignment,
      heightFactor: hFactor,
      widthFactor: wFactor,
      child: this,
    );
  }

  Widget get toLeft => () {
        return Align(
          alignment: Alignment.centerLeft,
          child: this,
        );
      }();

  Widget get toRight => () {
        return Align(
          alignment: Alignment.centerRight,
          child: this,
        );
      }();
}
