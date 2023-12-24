part of 'effects.dart';

extension CallableExt on Function {
  void delay(Duration duration) {
    Future.delayed(duration, () => {this.call()});
  }
}
