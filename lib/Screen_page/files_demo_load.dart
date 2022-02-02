import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage(), title: 'Shared preferences demo',),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage, required this.title}) : super(key: key);

  final CounterStorage storage;
  final String title;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {

  int _counter = 0;
  int _counter1 = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }

  Future<File> _incrementCounter1() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  void _incrementCounter2() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cосчитай дважды'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Кнопка нажата $_counter ра${_counter == 1 ? '' : 'з'}.'),
            const SizedBox(height: 30,),
            const Text('Я нажал на кнопку сколько раз?'),
             Text('$_counter1', style: Theme.of(context).textTheme.headline5),
        ],
      ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack (
          fit: StackFit.expand,
          children: [
          Positioned(
          left: 30,
          bottom: 20,
            child: FloatingActionButton(
              onPressed: _incrementCounter1,
              child: const Icon(
                 Icons.add,
                 size: 40,
            ),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

          Positioned(
          bottom: 20,
          right: 30,
            child: FloatingActionButton(
              onPressed: _incrementCounter2,
              child: const Icon(
                Icons.add,
                size: 40,
            ),
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20),
             ),
            ),
          ),
          ],
    ),
    );
  }
}
