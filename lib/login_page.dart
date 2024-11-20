import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'rmd' && password == '666') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DashboardPage(username: username),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Gagal"),
            content: const Text("Username atau password salah"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              )
            ],
          );
        },
      );
    }
  }

  void _handleForgotPassword() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController emailController = TextEditingController();
        return AlertDialog(
          title: const Text("Lupa Kata Sandi"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                  "Masukkan email atau nomor telepon Anda untuk reset kata sandi."),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email atau Nomor Telepon',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                Navigator.of(context).pop();
                _showPasswordResetConfirmation(email);
              },
              child: const Text("Kirim"),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordResetConfirmation(String email) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Permintaan Berhasil"),
          content: Text("Instruksi reset kata sandi telah dikirim ke $email"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A1C71), Color(0xFFD76D77), Color(0xFFFFAF7B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A1C71),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3A1C71),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _handleLogin,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: _handleForgotPassword,
                      child: const Text(
                        'Lupa Kata Sandi?',
                        style: TextStyle(
                          color: Color(0xFF3A1C71),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
