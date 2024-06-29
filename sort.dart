import 'tabungan.dart';

class Sorting {
  List<Tabungan> urutkanUang(Map<String, Tabungan> mapTabungan) {
    var tabunganList = mapTabungan.values.toList();
    tabunganList.sort((a, b) => a.uang.compareTo(b.uang));
    return tabunganList;
  }
}
