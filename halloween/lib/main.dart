import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(name: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name});

  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  List<bool> status = [
    false,
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(enough()),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 113, 34, 34),
        body: Center(
            child: Table(children: <TableRow>[
          TableRow(children: [
            buildTile(0),
            buildTile(1),
            buildTile(2),
            buildTile(3),
            buildTile(4),
          ]),
          TableRow(children: [
            buildTile(5),
            buildTile(6),
            buildTile(7),
            buildTile(8),
            buildTile(9)
          ]),
        ])));
  }

  Widget buildTile(int i) {
    return GestureDetector(
        onTap: () {
          click(i);
        },
        child: Card(
            child: Visibility(
                visible: status[i],
                child: SizedBox(
                    width: 175.0,
                    height: 175.0,
                    child: Image.asset("assets/pump.jpg", fit: BoxFit.fill)))));
  }

  void click(int i) {
    setState(() {
      if (status[i]) {
        count++;
        for (int i = 0; i < 10; i++) {
          int invisible = 1 + Random().nextInt(2);
          if (i % invisible == 0) {
            status[i] = !status[i];
          }
        }
        status[i] = false;
      }
    });
  }

  String enough() {
    if (count == 10) return "Happy Halloween!";
    if (count == 20) return "Okay you can stop playing now!";
    if (count >= 21) return "Okay keep going if you want...";
    return count.toString();
  }
}
