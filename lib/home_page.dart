import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('That is my website'),
      centerTitle: true,
    ),
    body: const Padding(
      padding: EdgeInsets.all(32),
      child: Placeholder(color: Colors.deepOrangeAccent),
    ),
  );
}
