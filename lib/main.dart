import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Menetapkan halaman pertama sebagai LoginPage
      routes: {
        // Daftarkan rute navigasi untuk DashboardPage (jika ingin menggunakan rute)
        '/dashboard': (context) =>
            const DashboardPage(username: 'User'), // Placeholder untuk username
      },
    );
  }
}
