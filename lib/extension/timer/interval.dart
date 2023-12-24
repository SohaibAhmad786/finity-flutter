part of 'timer.dart';

extension IntervalExtension on Duration {
  Timer interval(Function(Timer timer) func) {
    return Timer.periodic(this, func);
  }
}
