import 'package:flutter/material.dart';

class Menu3Page extends StatelessWidget {
  final String username; // Variabel untuk menerima username

  const Menu3Page({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Profil Pengguna',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Halo, $username!',
            style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Logout dan kembali ke login
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
