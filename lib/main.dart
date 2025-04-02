import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "belajarApp",
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        "/home" : (BuildContext context) => HomePage(),
        "/music" : (BuildContext context) => MusicPage(),
      } ,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: const Icon(Icons.menu),
      title: const Text("Aldan's App"),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(Icons.settings),
        ),
      ],
      backgroundColor: Colors.blueAccent,
    ),

      body: Center(
        child: Card(
          child: IconButton(
          icon: Icon(Icons.music_note),
          onPressed: (){
              Navigator.pushNamed(context, "/music");
            },
          ),
        ),
      )
    );
  }
}
class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Music"),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(Icons.settings),
        ),
      ],
      backgroundColor: Colors.blueAccent,
    ),

      body: Center(
        child: Card(
          child: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
              Navigator.pushNamed(context, "/home");
            },
          ),
        ),
      )
    );
  }
}