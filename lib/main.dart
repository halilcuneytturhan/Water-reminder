// main.dart
import 'package:flutter/material.dart';
import 'package:suhatirlatma/screens/login_screen.dart';

void main() {
  runApp(SuHatirlaticiApp());
}

class SuHatirlaticiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Su Hatırlatıcısı',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
