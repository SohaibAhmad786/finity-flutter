part of 'position.dart';

extension GroupExtension on Widget {
  /// Returns [Row] widget
  ///
  /// ### Use Cases
  /// - <b>[startChild]</b> Return a row with the passed child at position 0 of the children list
  /// - <b>[endChild]</b> Return a row with the passed child at last position of the children list
  /// - <b>[startChildren]</b> Return a row with the passed children at position 0... of the children list
  /// - <b>[endChildren]</b> Return a row with the passed child at last positions of the children list
  ///
  /// is
  Row groupAsRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? startChild,
    Widget? endChild,
    List<Widget>? startChildren,
    List<Widget>? endChildren,
    bool expanded = false,
  }) {
    if (startChild != null) {
      return Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [startChild, expanded ? Expanded(child: this) : this],
      );
    } else if (endChild != null) {
      return Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [expanded ? Expanded(child: this) : this, endChild],
      );
    } else if (startChildren != null) {
      return Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [
          ...startChildren,
          expanded ? Expanded(child: this) : this,
        ],
      );
    } else if (endChildren != null) {
      return Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [expanded ? Expanded(child: this) : this, ...endChildren],
      );
    }
    return Row(
      key: key,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textBaseline: textBaseline,
      textDirection: textDirection,
      children: [expanded ? Expanded(child: this) : this],
    );
  }

  /// Returns [Column] widget
  ///
  /// ### Use Cases
  /// - <b>[startChild]</b> Return a row with the passed child at position 0 of the children list
  /// - <b>[endChild]</b> Return a row with the passed child at last position of the children list
  /// - <b>[startChildren]</b> Return a row with the passed children at position 0... of the children list
  /// - <b>[endChildren]</b> Return a row with the passed child at last positions of the children list
  Column groupAsColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? startChild,
    Widget? endChild,
    List<Widget>? startChildren,
    List<Widget>? endChildren,
    bool expanded = false,
  }) {
    if (startChild != null) {
      return Column(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [startChild, expanded ? Expanded(child: this) : this],
      );
    } else if (endChild != null) {
      return Column(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [this, endChild],
      );
    } else if (startChildren != null) {
      return Column(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [...startChildren, expanded ? Expanded(child: this) : this],
      );
    } else if (endChildren != null) {
      return Column(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        children: [expanded ? Expanded(child: this) : this, ...endChildren],
      );
    }
    return Column(
      key: key,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textBaseline: textBaseline,
      textDirection: textDirection,
      children: [expanded ? Expanded(child: this) : this],
    );
  }
}
