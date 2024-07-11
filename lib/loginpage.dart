import 'package:flutter/material.dart';
import 'package:aas/homepage.dart';
import 'package:aas/regispage.dart';
import 'package:aas/background_widget.dart'; // Impor widget BackgroundWidget
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String _loginUrl = 'https://fakestoreapi.com/aas/login'; // Replace with your actual URL

  Future<void> _login(BuildContext context) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Homepage();
      }));
    } else {
      print('Login failed: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: Server error'),
        ),
      );
    }
  }

  void _localLogin(BuildContext context, String username, String password) {
    if (username == "admin" && password == "admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Homepage();
        }),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('Password Salah, silahkan ulangi lagi'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment.centerRight, child: Text('Login')),
        leading: Icon(Icons.home),
      ),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                        "https://images.tokopedia.net/img/cache/700/VqbcmM/2023/2/4/1a319100-83ea-4807-aab0-71d56b493834.jpg"),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tips Fotografi',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisPage()),
                          );
                        },
                        child: Text('Register'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _login(context);
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: Text('masuk tanpa login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
