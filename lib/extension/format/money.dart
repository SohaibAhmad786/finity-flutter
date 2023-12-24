part of 'format.dart';

extension FormatExtensionFromString on String {
  String get toMoney => () {
        return "₦$this";
      }();
}

extension FormatExtensionFromNum on num {
  String get toMoney => () {
        return "₦${NumberFormat.currency(name: '', decimalDigits: 2).format(this)}";
      }();

  String get toSimpleNum => () {
        return "₦${NumberFormat.compact().format(this)}";
      }();
}
