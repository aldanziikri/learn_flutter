import 'package:flutter/material.dart';

void main() => runApp(const Profil());

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://image.idntimes.com/post/20220916/one-piece-monkey-d-luffy-smile-59a26c5e8297d087d446fcc4886367d2.jpg")
          ],
        )
    );
  }
}