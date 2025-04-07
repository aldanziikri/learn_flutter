import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("Set Alarm"),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Set Timer"),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("Set Alarm"),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Set Timer"),
            )
          ],
    );
  }
}