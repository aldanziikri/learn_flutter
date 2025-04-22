import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
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
                validator: (value) {
                  if (value == ""){
                    return "password wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  
                  hintText: "password",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
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