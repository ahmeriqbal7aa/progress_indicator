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
  double _start = 0.0;
  // TODO Create updateIndicator Function
  // which update the indicator periodically
  void updateIndicator() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _initial = _initial + 0.01;
      });
    });
  }

  // TODO Create stepIndicator Widget
  Widget _stepIndicator() {
    // As we have 5 steps so we multiply 5 with initial value
    // [0] mean we want just first value (not in points)
    String value = (_start * 5).toString()[0];
    return Column(
      children: [
        Text('Step $value of 5 Completed'),
        SizedBox(height: 25.0),
        LinearProgressIndicator(
          value: _start,
          minHeight: 15.0,
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
        SizedBox(height: 25.0),
        RaisedButton(
          onPressed: () {
            setState(() {
              _start = _start + 0.2;
            });
          },
          child: Text('Next'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ////////////////// CHECK Using STEP //////////////////////////
              _stepIndicator(),
              //////////////////////////////////////////////////////////////
              SizedBox(height: 50.0),
              Divider(thickness: 1.5, color: Colors.black),
              SizedBox(height: 50.0),
              ////////////////// CHECK PERIODICALLY //////////////////////////
              LinearProgressIndicator(
                value: _initial,
                minHeight: 15.0,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
              SizedBox(height: 25.0),
              CircularProgressIndicator(
                value: _initial,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
              SizedBox(height: 25.0),
              RaisedButton(
                onPressed: () {
                  // here updateIndicator Function call
                  updateIndicator();
                },
                child: Text('Check Periodically'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
