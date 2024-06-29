import 'tabungan.dart';

class StackTabungan {
  final List<Tabungan> _stack = [];

  void push(Tabungan value) {
    _stack.add(value);
  }

  Tabungan? pop() {
    Tabungan? data;

    if (_stack.isNotEmpty) {
      data = _stack.removeLast();
    } else {
      data = null;
    }

    return data;
  }

  void lihatDataHapus() {
    if (_stack.isEmpty) {
      print('Tidak ada data yang dihapus.');
    } else {
      print('Data yang dihapus:');
      for (var tabungan in _stack) {
        print(tabungan);
      }
    }
  }
}
