import 'dart:math';
// import 'package:fingers/say_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            title: Text('Fingers 🖐🤚☝🤙👌✌🤞'),
          ),
          body: Finregs(),
        ));
  }
}

class Finregs extends StatefulWidget {
  @override
  _FinregsState createState() => _FinregsState();
}

class _FinregsState extends State<Finregs> {
  int numLeft = 5;
  int numRight = 5;
  int genRandomIntToFive() {
    var random = Random();
    return (random.nextInt(5) + 1);
  }
  final FlutterTts flutterTts = FlutterTts()..setSpeechRate(1.0)..setVolume(1.0)..setPitch(1.0)..setLanguage('ru-RU');


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Left hand
            Card(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        numLeft = genRandomIntToFive();
                        flutterTts.speak('$numLeft');
                      });
                    },
                    child: Image.asset('assets/images/$numLeft-$numLeft.png'))),
            //Right hand
            Card(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        numRight = genRandomIntToFive();
                        flutterTts.speak('$numRight');
                      });
                    },
                    child: Image.asset('assets/images/$numRight.png'))),
          ],
        ),
        // SayWord(),
      ],
    );
  }
}
