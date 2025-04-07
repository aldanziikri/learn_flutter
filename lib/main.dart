import 'package:flutter/material.dart';
import 'package:my_app/page/account.dart';
import 'package:my_app/page/home.dart';
import 'package:my_app/page/likes.dart';
import 'package:my_app/page/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Color.fromARGB(255, 32, 107, 188),
            title: Text("Aldan's App"),
            actions: [Icon(Icons.settings)],
            bottom: TabBar(tabs: [
              // Text("Home"),
              // Text("Search"),
              // Text("Notification"),
              // Text("Account")
              Tab(icon: Icon(Icons.dashboard, color: Color.fromARGB(255, 255, 255, 255))),
              Tab(icon: Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255))),
              Tab(icon: Icon(Icons.favorite, color: Color.fromARGB(255, 255, 255, 255))),
              Tab(icon: Icon(Icons.account_balance, color: Color.fromARGB(255, 255, 255, 255)))
            ]),
          ),
          body: TabBarView(
            children: [
              Home(data: List<String>.generate(40, (i) => "data ke ${i+1}",)),
              Search(),
              Likes(),
              Profil()
            ]
          )
        ),
      );
  }
}
