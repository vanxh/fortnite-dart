/// curve table reader
class CurveTable {
  /// keys of the curve table
  late List<List<num>> keys;

  /// curve table object
  CurveTable(this.keys);

  /// eval curve table
  num eval(num key) {
    int i = keys.indexWhere((k) => k[0] > key);

    List<num> prev = keys[i - 1];
    List<num> next = keys[i];

    num fac = (key - prev[0]) / (next[0] - prev[0]);

    return prev[1] * (1 - fac) + next[1] * fac;
  }
}
