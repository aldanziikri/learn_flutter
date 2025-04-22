import 'package:flutter/material.dart';
import 'package:my_app/page/auth/splash_page.dart';
import 'package:my_app/page/user_detail.dart';
import 'package:my_app/page/account.dart';
import 'package:my_app/page/home.dart';
import 'package:my_app/page/likes.dart';
import 'package:my_app/page/search.dart';
import 'package:my_app/post/add_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String picture1 =
      "https://i.pinimg.com/736x/43/ed/52/43ed52cb6262df9666940dae0454359a.jpg";
  String picture2 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC-WGCEPDVGAtfwQ9D07PX9FLgJuX9kwY_WA&s";
  String email1 = "aldanzikri32@gmail.com";
  String email2 = "intansayang@gmail.com";
  String name1 = "Aldan Zikri";
  String name2 = "Intan Putri";
  String currentUser = "";
  String currentEmail = "";
  String currentName = "";
  bool isUser1 = true;

  @override
  void initState() {
    currentUser = picture1;
    currentName = name1;
    currentEmail = email1;
    super.initState();
  }

  void gantiUser() {
    setState(() {
      isUser1 = !isUser1;
      currentUser = isUser1 ? picture1 : picture2;
      currentEmail = isUser1 ? email1 : email2;
      currentName = isUser1 ? name1 : name2;
    });
  }

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
              GestureDetector(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => UserDetail(
                                name: currentName,
                                picture: isUser1 ? picture1 : picture2,
                              ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(currentUser),
                    ),
                  ),
                  accountName: Text(currentName),
                  accountEmail: Text(currentEmail),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(currentUser),
                      fit: BoxFit.cover,
                    ),
                  ),
                  otherAccountsPictures: [
                    GestureDetector(
                      onTap: () => gantiUser(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          isUser1 ? picture2 : picture1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text("Profil"),
                trailing: Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => UserDetail(
                            name: currentName,
                            picture: isUser1 ? picture1 : picture2,
                          ),
                    ),
                  );
                },
              ),
              ListTile(title: Text("Setting"), trailing: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(children: [Home(), Search(), Likes(), Profil()]),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddPost()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
