import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/kehadiran_provider.dart';
import 'screen/kehadiran_screen.dart';
import 'screen/riwayat_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KehadiranProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kehadiran Siswa',
      theme: ThemeData(
        primarySwatch:  Colors.red,
      ),
      home: KehadiranApp(),
    );
  }
}

class KehadiranApp extends StatefulWidget {
  @override
  _KehadiranAppState createState() => _KehadiranAppState();
}

class _KehadiranAppState extends State<KehadiranApp> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    KehadiranScreen(),
    RiwayatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 175, 76, 76),
        onTap: _onItemTapped,
      ),
    );
  }
}