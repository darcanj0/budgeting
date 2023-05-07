class Transaction {
  late final String _id;
  late final String _title;
  late final double _value;
  late final DateTime _date;

  Transaction(
      {required String id,
      required String title,
      required double value,
      required DateTime date}) {
    _id = id;
    _title = title;
    _date = date;
    _value = value;
  }

  String get id {
    return _id;
  }

  String get title {
    return _title;
  }

  DateTime get date {
    return _date;
  }

  double get value {
    return _value;
  }
}
