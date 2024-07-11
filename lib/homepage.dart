import 'package:flutter/material.dart';
import 'package:aas/profilpage.dart';
import 'package:aas/loginpage.dart'; // Impor halaman Login
import 'package:aas/background_widget.dart'; // Impor widget BackgroundWidget

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: BackgroundWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home', style: TextStyle(fontSize: 24, color: Colors.white)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profilpage()),
                      );
                    },
                    child: Text('Profil'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Kembali'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
