part of 'effects.dart';

extension MaterialProperty<TType> on TType {
  MaterialStatePropertyAll<TType> get all => () {
        return MaterialStatePropertyAll(this);
      }();
}
