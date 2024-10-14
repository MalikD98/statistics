// main.dart
import 'package:flutter/material.dart';
import 'views/player_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volley Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerListPage(),
    );
  }
}
