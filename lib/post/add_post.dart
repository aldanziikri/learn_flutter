

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  String? token;
  int? userId;

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
      userId = prefs.getInt("userId");
    });
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  void addPost (String caption) async{
    final respon = await http.post(Uri.parse(
      "http://192.168.100.235:8000/api/v1/posts"
    ),
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    },
    body: {
      "caption": caption
    }
    );
    if (!mounted) {return;}
    else if (respon.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post berhasil dibuat status :${respon.statusCode}")));
    }
    else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post gagal dibuat status :${respon.statusCode}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Post Baru"),
        backgroundColor: Color.fromARGB(255, 32, 107, 188),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Caption",
                  border: OutlineInputBorder() 
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  addPost(controller.text);
                }, 
                child: Text("Tambah Post")
                ),
            ],
          ),
        )
      ),
    );
  }
}