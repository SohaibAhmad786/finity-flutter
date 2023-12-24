part of size_extension;

extension PaddingSizingDouble on num {
  EdgeInsets get pdAll => () {
        return EdgeInsets.all(toDouble());
      }();

  EdgeInsets get pdX => () {
        return EdgeInsets.symmetric(horizontal: toDouble());
      }();

  EdgeInsets get pdY => () {
        return EdgeInsets.symmetric(vertical: toDouble());
      }();

  EdgeInsets get pdL => () {
        return EdgeInsets.only(left: toDouble());
      }();

  EdgeInsets get pdR => () {
        return EdgeInsets.only(right: toDouble());
      }();

  EdgeInsets get pdB => () {
        return EdgeInsets.only(bottom: toDouble());
      }();

  EdgeInsets get pdT => () {
        return EdgeInsets.only(top: toDouble());
      }();

  EdgeInsets pd(double right, double bottom, double left) {
    return EdgeInsets.fromLTRB(left, toDouble(), right, bottom);
  }
}

extension PaddingSizingList on List<num> {
  EdgeInsets get pd => () {
        if (length < 1) {
          return EdgeInsets.zero;
        } else if (length == 1) {
          return EdgeInsets.all(first.toDouble());
        } else if (length == 2) {
          return EdgeInsets.symmetric(
              vertical: first.toDouble(), horizontal: last.toDouble());
        } else if (length == 3) {
          return EdgeInsets.only(
              top: elementAt(0).toDouble(),
              left: elementAt(1).toDouble(),
              right: elementAt(2).toDouble());
        } else if (length == 4) {
          return EdgeInsets.only(
            top: elementAt(0).toDouble(),
            left: elementAt(1).toDouble(),
            bottom: elementAt(2).toDouble(),
            right: elementAt(2).toDouble(),
          );
        }
        throw Exception("List can't have more than 4 elements");
      }();
}
