part of 'sizing.dart';

extension BlankSpaceExtension on num {
  Widget get bh => () {
        return SizedBox(
          height: toDouble(),
        );
      }();

  Widget get bw => () {
        return SizedBox(
          width: toDouble(),
        );
      }();

  Widget get bhw => () {
        return SizedBox(
          width: toDouble(),
          height: toDouble(),
        );
      }();
}
