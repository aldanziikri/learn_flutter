import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPost extends StatefulWidget {
  final Map post;
  const EditPost({super.key, required this.post});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();

    @override
  void initState() {
    super.initState();
    controller.text = widget.post['caption'];
  }


  void editPost(caption, id) async{
    final respon = await http.put(Uri.parse(
      "http://192.168.100.235:8000/api/v1/posts/$id"
    ),
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer 1|LM7OHpYu5pR2Gl5ygem6wGz6nuG50AASLYq2n8zU016d5822",
    },
    body: {
      "caption": caption
    }
    );

    if (!mounted) return;
      if (respon.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post berhasil diedit")));
      }
      else{
        final output = jsonDecode(respon.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(output['message'])));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit post"),
        backgroundColor: Color.fromARGB(255, 32, 107, 188)
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'caption',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                onPressed: (){
                  editPost(controller.text, widget.post['id']);
                }, 
                child: Text("Edit Post")
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}