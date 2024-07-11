import 'package:flutter/material.dart';
import 'package:aas/loginpage.dart';
import 'package:aas/homepage.dart'; // Impor halaman Home
import 'package:aas/background_widget.dart'; // Impor widget BackgroundWidget

class Profilpage extends StatelessWidget {
  const Profilpage({super.key});

  bool _isUserLoggedIn() {
    // Implementasi logika untuk memeriksa apakah pengguna sudah login
    // Misalnya, Anda bisa menggunakan SharedPreferences atau penyimpanan lain untuk menyimpan status login
    // Untuk contoh ini, kita asumsikan pengguna belum login
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = _isUserLoggedIn();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Page'),
      ),
      body: BackgroundWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLoggedIn) ...[
                Text('Anda belum login', style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Kembali ke Login'),
                ),
              ] else ...[
                Text('Profil', style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Text('Kembali ke Home'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
