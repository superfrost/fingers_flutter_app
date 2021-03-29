import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';


class SayWord extends StatefulWidget {
  SayWord({Key key}) : super(key: key);

  @override
  _SayWordState createState() => _SayWordState();
}

class _SayWordState extends State<SayWord> {
  final FlutterTts flutterTts = FlutterTts()..setSpeechRate(1.0)..setVolume(1.0)..setPitch(1.0);
  String defaultLocale = Platform.localeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
              // await flutterTts.setLanguage('en_US');
              await flutterTts.speak('Hello guys');
            setState(() {});
          },
          child: Text('Speak to me')),
        ElevatedButton(
          onPressed: () async {
              // await flutterTts.setLanguage('ru-RU');
              await flutterTts.speak('Сколько всего пальцев на двух руках?');
            setState(() {});
          },
          child: Text('Speak Russ')),
        ElevatedButton(
          onPressed: () {
            setState(() {
              flutterTts.stop();
            });
          },
          child: Text('Stop')),
        ElevatedButton(
          onPressed: () async {
            print(defaultLocale);
            if(defaultLocale == 'en_US') {
              await flutterTts.setLanguage('ru-RU');
              setState(() {
                defaultLocale = 'ru_RU';
              });
            } else {
              await flutterTts.setLanguage('en-US');
              setState(() {
                defaultLocale = 'en_US';
              });
            }
          },
          child: Text(defaultLocale)),
      ],
    );
  }
}