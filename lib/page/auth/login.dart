

import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'package:my_app/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    final dio = Dio();
    
      final respon = await dio.post("http://192.168.100.235:8000/api/v1/auth/login", data: {
        "username": usernameController.text,
        "password": passwordController.text,
      },
      options: Options(
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ));

      if(!mounted)return;
      if (respon.statusCode == 200){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      else {
        final data = respon.data;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Terjadi kesalahan")),
        );
        setState(() {
          isLoading = false;
        });
      }
      
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Silakan Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == ""){
                    return "username wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "username",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == ""){
                    return "password wajib diisi";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "password",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              isLoading ? CircularProgressIndicator() : ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    login();
                  }
                }, 
                child: Text("Login")
              )
            ],
          ),
        ),
      ),
    );
  }
}