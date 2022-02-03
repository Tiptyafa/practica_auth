import 'package:flutter/material.dart';
import 'package:practica_1/Net/Post_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Загрузка из сети',
      home: PostScreen(
        id: 1,
      ),
    );
  }
}
