part of 'position.dart';

extension CenterExtension on Widget {
  Widget get center => () {
        return Center(child: this);
      }();
}
