part of 'format.dart';

extension DateExtension on String {
  String get asDateString => () {
        final date = DateTime.parse(this);
        return DateTimeFormat.format(date, format: r'm/d/Y');
      }();
}
