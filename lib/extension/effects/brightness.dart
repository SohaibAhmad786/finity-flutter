part of 'effects.dart';

extension BrightnessExt on Brightness {
  bool get isDark => () {
        return this == Brightness.dark;
      }();

  bool get isLight => () {
        return this == Brightness.light;
      }();

  Brightness get opposite => () {
        return this == Brightness.light ? Brightness.dark : Brightness.light;
      }();
}
