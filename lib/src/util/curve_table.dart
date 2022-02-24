/// curve table reader
class CurveTable {
  /// keys of the curve table
  late List<List<num>> keys;

  /// [CurveTable] constructor
  CurveTable(this.keys);

  /// eval curve table
  num eval(num key) {
    if (key < keys[0][0]) {
      return [0][1];
    }

    if (key >= keys[keys.length - 1][0]) {
      return keys[keys.length - 1][1];
    }

    int i = keys.indexWhere((k) => k[0] > key);

    List<num> prev = keys[i - 1];
    List<num> next = keys[i];

    num fac = (key - prev[0]) / (next[0] - prev[0]);

    return prev[1] * (1 - fac) + next[1] * fac;
  }
}
