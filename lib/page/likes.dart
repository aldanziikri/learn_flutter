import 'package:flutter/material.dart';

void main() => runApp(const Likes());

class Likes extends StatelessWidget {
  const Likes({super.key});

  @override

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 40,),
            Text("Notification", style: TextStyle(fontSize: 30),)
          ],
        )
    );
  }
}