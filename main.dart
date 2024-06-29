import 'dart:io';
import 'tabungan.dart';
import 'searching.dart';
import 'sort.dart';
import 'stack.dart';

void main() {
  var mapTabungan = <String, Tabungan>{};
  var tabungan = Tabungan("Nama", 0);
  var searching = Searching();
  var sorting = Sorting();
  var stackHapus = StackTabungan();
  bool keluar = false;

  while (!keluar) {
    print('Sistem Manajemen Tabungan Sederhana');
    print('Menu:');
    print('1. Setor tunai');
    print('2. Tarik tabungan');
    print('3. Cari nama penabung');
    print('4. Tampilkan semua penabung');
    print('5. Lihat daftar tabungan dari terkecil ke terbesar');
    print('6. Hapus data penabung');
    print('7. Lihat data yang dihapus');
    print('8. Kembalikan data yang dihapus');
    print('9. Simpan data');
    print('10. Keluar');
    stdout.write('Pilih opsi (1-10): ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        String nama;
        while (true) {
          stdout.write('Masukkan nama penabung : ');
          nama = stdin.readLineSync()!;
          if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(nama)) {
            break;
          } else {
            print('Nama tidak valid. Harap masukkan hanya huruf.');
          }
        }
        stdout.write('Masukkan jumlah uang yang ingin ditabung : ');
        var jumlah = double.parse(stdin.readLineSync()!);
        if (mapTabungan.containsKey(nama)) {
          mapTabungan[nama]!.uang += jumlah;
        } else {
          var tabunganBaru = Tabungan(nama, jumlah);
          mapTabungan[nama] = tabunganBaru;
        }
        break;

      case '2':
        stdout.write('Masukkan nama penabung : ');
        var nama = stdin.readLineSync()!;
        if (mapTabungan.containsKey(nama)) {
          stdout.write('Masukkan jumlah uang yang ingin diambil? ');
          var jumlah = double.parse(stdin.readLineSync()!);
          if (mapTabungan[nama]!.uang >= jumlah) {
            mapTabungan[nama]!.uang -= jumlah;
          } else {
            print('Saldo tidak mencukupi.');
          }
        } else {
          print('Nama tidak ditemukan.');
        }
        break;

      case '3':
        stdout.write('Masukkan nama penabung yang dicari : ');
        var nama = stdin.readLineSync()!;
        var tabunganDicari = searching.cariTabungan(mapTabungan, nama);
        if (tabunganDicari != null) {
          print('Data tabungan ditemukan :');
          print(tabunganDicari);
        } else {
          print('Nama tidak ditamukan.');
        }
        break;

      case '4':
        if (mapTabungan.isEmpty) {
          print('Tidak ada data penabung.');
        } else {
          print('Daftar semua penabung:');
          mapTabungan.values.forEach((tabungan) {
            print(tabungan);
          });
        }
        break;

      case '5':
        if (mapTabungan.isEmpty) {
          print('Tidak ada data penabung.');
        } else {
          var sortedList = sorting.urutkanUang(mapTabungan);
          print('Daftar tabungan dari terkecil ke terbesar:');
          sortedList.forEach((tabungan) {
            print(tabungan);
          });
        }
        break;

      case '6':
        stdout.write('Masukkan nama penabung yang akan dihapus: ');
        var nama = stdin.readLineSync()!;
        if (mapTabungan.containsKey(nama)) {
          var tabunganDihapus = mapTabungan.remove(nama);
          if (tabunganDihapus != null) {
            stackHapus.push(tabunganDihapus);
            print('Data tabungan berhasil dihapus.');
          }
        } else {
          print('Nama tidak ditemukan.');
        }
        break;

      case '7':
        stackHapus.lihatDataHapus();
        break;

      case '8':
        var dataDikembalikan = stackHapus.pop();
        if (dataDikembalikan != null) {
          mapTabungan[dataDikembalikan.nama] = dataDikembalikan;
          print('Data tabungan berhasil dikembalikan:');
          print(dataDikembalikan);
        } else {
          print('Tidak ada data untuk dikembalikan.');
        }
        break;

      case '9':
        stdout.write('Masukkan nama file untuk menyimpan data : ');
        var namaFile = stdin.readLineSync()!;
        tabungan.simpandata(mapTabungan, namaFile);
        keluar = true;
        break;

      case '10':
        keluar = true;
        break;

      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
