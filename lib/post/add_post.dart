

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  void addPost (String caption) async{
    final respon = await http.post(Uri.parse(
      "http://192.168.100.235:8000/api/v1/posts"
    ),
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer 1|LM7OHpYu5pR2Gl5ygem6wGz6nuG50AASLYq2n8zU016d5822",
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