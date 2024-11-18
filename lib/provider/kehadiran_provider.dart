import 'package:flutter/material.dart';
import 'package:kehadiran_siswa/models/siswa.dart';

class KehadiranProvider with ChangeNotifier {
  List<Siswa> _siswa = [
    Siswa(nama: 'Siska'),
    Siswa(nama: 'Lestari'),
    Siswa(nama: 'Ayu'),
    Siswa(nama: 'Fatim'),
  ];

  List<Map<String, dynamic>> attendanceHistory = [];

  List<Siswa> get siswa => _siswa;

  void toggleAttendance(int index) {
    _siswa[index].hadir = !_siswa[index].hadir;
    notifyListeners();
  }

  void saveAttendance() {
    int jumlahHadir = _siswa.where((student) => student.hadir).length;
    int jumlahTidakHadir = _siswa.length - jumlahHadir;

    attendanceHistory.insert(0, {
      'tanggal': DateTime.now(),
      'jumlahHadir': jumlahHadir,
      'jumlahTidakHadir': jumlahTidakHadir,
    });

    // Reset attendance
    for (var siswa in _siswa) {
      siswa.hadir = false;
    }

    notifyListeners();
  }
}