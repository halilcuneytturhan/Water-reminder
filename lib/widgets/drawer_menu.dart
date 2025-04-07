import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Su Ömrü uzatır"),
            accountEmail: Text("Su iç, güzelleş."),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.water_drop),
            title: Text("Günlük Hedef: 3 Litre"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Çıkış Yap"),
            onTap: () {
              Navigator.of(context).pop(); // Drawer'ı kapat
              Navigator.of(context).pop(); // Ana ekrandan çık
            },
          ),
        ],
      ),
    );
  }
}
