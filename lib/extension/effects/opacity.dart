part of 'effects.dart';

extension WidgetOpacity on Widget {
  Widget opacity(double level) {
    return Opacity(
      opacity: level,
      child: this,
    );
  }
}
