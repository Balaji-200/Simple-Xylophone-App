import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _Xylophone createState() => _Xylophone();
}

class _Xylophone extends State<Xylophone> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Xylophone'),
      ),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Brown-wooden-parquet-texture.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            xylophoneKey("note1.wav", Colors.red, size.width * 0.95, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note2.wav", Colors.orange, size.width * 0.9, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note3.wav", Colors.yellow, size.width * 0.85, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note4.wav", Colors.green, size.width * 0.8, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note5.wav", Colors.lightBlue, size.width * 0.75, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note6.wav", Colors.deepPurple, size.width * 0.7, size.height),
            SizedBox(height: 10),
            xylophoneKey(
                "note7.wav", Colors.pinkAccent, size.width * 0.65, size.height),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget xylophoneKey(String note, Color color, double width, double height) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: color,
        child: InkWell(
            child: Container(
              // height: height / 9,
              width: width,
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.circle, color: Colors.black),
                  trailing: Icon(Icons.circle, color: Colors.black),
                ),
              ),
            ),
            onTap: () {
              final audioCache = AudioCache();
              audioCache.play(note);
            }),
      ),
    );
  }
}
