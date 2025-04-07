import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  int _remainingSeconds = 3600; // 1 saat

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _showReminderDialog();
          _remainingSeconds = 3600;
        }
      });
    });
  }

  void _showReminderDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("SU İÇMEYİ UNUTMA!!"),
            content: Text("1 SAAT DOLDU!! Lütfen Su içmeyi unutma!!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Tamam"),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Su Hatırlatıcısı")),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hoş geldin, ${widget.username}!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text("Bir sonraki hatırlatma:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              _formatTime(_remainingSeconds),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
