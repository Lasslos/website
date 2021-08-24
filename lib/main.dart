import 'package:flutter/material.dart';

import 'canada.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laslo Hauschild',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'Laslo Hauschild'),
      },
      initialRoute: '',
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      actions: [

      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Du hast den Knopf'),
          Text(_counter.toString(), style: TextStyle(fontSize: 24)),
          Text('mal gedrückt.'),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() {
          _incrementCounter();
        });
      },
      child: Icon(
        Icons.water_damage_outlined
      ),
    ),
  );

  void _incrementCounter() => _counter++;
}