part of 'effects.dart';

extension OptionsExtension<T> on bool {
  T? option({required T whenTrue, T? whenFalse}) {
    final T tFunc = whenTrue;
    if (tFunc is Function) {
      if (this) {
        tFunc.call();
      } else {
        (whenFalse as Function?)?.call();
      }
    }
    return this ? whenTrue : whenFalse;
  }
}
