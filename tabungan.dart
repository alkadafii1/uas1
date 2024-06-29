import 'dart:io';

class Tabungan {
  String nama;
  double uang;

  Tabungan(this.nama, this.uang);

  String toString() {
    return '$nama: Rp.${uang.toStringAsFixed(2)}';
  }

  void simpandata(Map<String, Tabungan> mapTabungan, String namaFile) {
    var file = File(namaFile);
    var baca = file.openWrite();

    var tanggal = DateTime.now();
    baca.write('Tanggal: ${tanggal.toIso8601String()}\n');

    mapTabungan.forEach((nama, tabungan) {
      baca.write('$nama,${tabungan.uang.toStringAsFixed(2)}\n');
    });

    baca.close();
    print('Data berhasil disimpan ke $namaFile');
  }
}
