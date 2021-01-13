import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _initial = 0.0;
  //TODO Create Function
  // which update the indicator periodically
  void updateIndicator() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _initial = _initial + 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    updateIndicator();
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: Icon(Icons.file_download, color: Colors.black, size: 35.0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              LinearProgressIndicator(
                value: _initial,
                minHeight: 15.0,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
              SizedBox(height: 50.0),
              CircularProgressIndicator(
                value: _initial,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
