part of 'sizing.dart';

extension ExpandedExtension on Widget {
  Widget get expand => () {
        return Expanded(
          child: this,
        );
      }();

  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }
}
