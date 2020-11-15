import 'package:flutter/material.dart';

// バーコード読み込み
class read_code extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('バーコード読み取り'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.g_translate),
            title: Text("Google"),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text("Dart"),
          ),
          ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text("Flutter"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.brightness_1_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
