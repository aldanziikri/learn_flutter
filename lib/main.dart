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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          MyButton(buttonIcon: Icon(Icons.home), buttonName: "Home"),
          MyButton(buttonIcon: Icon(Icons.search), buttonName: "Search"),
          MyButton(buttonIcon: Icon(Icons.account_balance), buttonName: "Account"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonIcon, required this.buttonName});

  final Icon buttonIcon;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            buttonIcon, 
            const SizedBox(height: 8), 
            Text(
              buttonName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
