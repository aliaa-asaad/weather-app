import 'package:flutter/material.dart';
import 'dart:math';

class StudyingFlutter extends StatefulWidget {
  const StudyingFlutter({super.key});

  @override
  State<StudyingFlutter> createState() => _StudyingFlutterState();
}

class _StudyingFlutterState extends State<StudyingFlutter> {
  bool _visible = true;
  double _height = 50;
  double _width = 50;
  Color _color = Colors.purpleAccent;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible == true ? 0 : 1,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,
                decoration:
                    BoxDecoration(color: _color, borderRadius: _borderRadius),
              ),
              Text(
                'Aliaa',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
              _height = random.nextInt(300).toDouble();
              _width = random.nextInt(300).toDouble();
              _borderRadius =
                  BorderRadius.circular(random.nextInt(30).toDouble());
              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                  random.nextInt(256), _visible == true ? 1 : 0);
            });
          },
          child: Icon(Icons.add)),
    );
  }
}
