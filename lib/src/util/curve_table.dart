/// curve table reader
class CurveTable {
  /// keys of the curve table
  List<List<num>> keys = [];

  /// curve table object
  CurveTable(List<dynamic> data) {
    for (var i = 0; i < data.length; i++) {
      keys.add([
        num.parse(data[i]?["KeyTime"].toString() ?? ""),
        num.parse(data[i]?["KeyValue"].toString() ?? ""),
      ]);
    }
  }

  /// eval curve table
  num eval(num key) {
    int i = keys.indexWhere((k) => k[0] > key);

    List<num> prev = keys[i - 1];
    List<num> next = keys[i];

    num fac = (key - prev[0]) / (next[0] - prev[0]);

    return prev[1] * (1 - fac) + next[1] * fac;
  }
}
