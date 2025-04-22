import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/page/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    isLogin();
  }

  void isLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if(!mounted)return;
    if (token != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}