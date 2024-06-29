import 'tabungan.dart';

class Searching {
  Tabungan? cariTabungan(Map<String, Tabungan> mapTabungan, String nama) {
    return mapTabungan[nama];
  }
}
