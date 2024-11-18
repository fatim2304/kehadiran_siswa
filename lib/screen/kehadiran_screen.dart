import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';

class KehadiranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kehadiran Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.siswa.length,
                itemBuilder: (context, index) {
                  final siswa = provider.siswa[index];
                  return CheckboxListTile(
                    title: Text(siswa.nama), // Menggunakan nama siswa
                    value: siswa.hadir, // Status hadir
                    onChanged: (value) {
                      provider.toggleAttendance(index); // Memanggil method toggleAttendance
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.siswa.isEmpty ? null : () {
                  provider.saveAttendance(); // Menyimpan data kehadiran
                },
                child: Text('Simpan Kehadiran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}