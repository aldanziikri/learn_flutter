import 'package:flutter/material.dart';
import 'package:my_app/page/account.dart' ;
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
      title: "belajarApp",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState(){
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Aldan's App", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        backgroundColor: const Color.fromARGB(255, 47, 120, 180),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.dashboard, color: Color.fromARGB(255, 255, 255, 255))),
            Tab(icon: Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255))),
            Tab(icon: Icon(Icons.favorite, color: Color.fromARGB(255, 255, 255, 255))),
            Tab(icon: Icon(Icons.account_balance, color: Color.fromARGB(255, 255, 255, 255)))
          ],
        )
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Home(),
          Search(),
          Likes(),
          Profil()
        ],
      ),
    );
  }
}