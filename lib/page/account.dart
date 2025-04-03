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
            Icon(Icons.account_balance, size: 40,),
            Text("Account", style: TextStyle(fontSize: 30),)
          ],
        )
    );
  }
}