part of 'effects.dart';

extension BuildContextExt on BuildContext {
  FocusScopeNode get focus => () {
        return FocusScope.of(this);
      }();

  Brightness get brightness => () {
        if (theme.colorScheme.brightness == Brightness.light) {
          return GetPlatform.isAndroid ? Brightness.light : Brightness.dark;
        }
        return GetPlatform.isAndroid ? Brightness.dark : Brightness.light;
      }();

  Brightness bright(Brightness val) {
    if (val == Brightness.light) {
      return GetPlatform.isAndroid ? Brightness.dark : Brightness.light;
    }
    return GetPlatform.isAndroid ? Brightness.light : Brightness.dark;
  }
}
