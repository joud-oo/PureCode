import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:purecode_project/Home.dart';

class myOpenPage extends StatefulWidget {
  const myOpenPage({super.key});

  @override
  _myOpenPageState createState() => _myOpenPageState();
}

class _myOpenPageState extends State<myOpenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C6179),
          toolbarHeight: 2,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 270.0, 15.0, 0.0),
            child: Column(
              children: [
                Image(image: AssetImage('assets/Logo with Font.jpg')),
                LoadingAnimationWidget.stretchedDots(
                  color: const Color(0xff1C6179),
                  size: 60,
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}