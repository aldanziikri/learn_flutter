

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
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
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
          backgroundColor: Color.fromARGB(255, 32, 107, 188),
          title: Text("Aldan's App"),
          actions: [Icon(Icons.settings)],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.dashboard,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_balance,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/luffy.jpg")),
                accountName: Text("Aldan Zikri"),
                accountEmail: Text("aldanzikri32@gmail.com"),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/luffy.jpg"), fit: BoxFit.cover),
                ),
                otherAccountsPictures: [CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC-WGCEPDVGAtfwQ9D07PX9FLgJuX9kwY_WA&s"),)],
              ),
              ListTile(title: Text("Profil"), trailing: Icon(Icons.person)),
              ListTile(title: Text("Setting"), trailing: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(children: [Home(), Search(), Likes(), Profil()]),
      ),
    );
  }
}
