import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran_siswa/provider/kehadiran_provider.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.attendanceHistory.length,
        itemBuilder: (context, index) {
          final record = provider.attendanceHistory[index];
          final date = record['tanggal'] as DateTime;

          return ListTile(
            title: Text('${date.day}-${date.month}-${date.year}'),
            subtitle: Text(
                'Hadir: ${record['jumlahHadir']}, Tidak Hadir: ${record['jumlahTidakHadir']}'),
          );
        },
      ),
    );
  }
}