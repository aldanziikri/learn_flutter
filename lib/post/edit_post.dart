import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  void editPost(){
    
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
                    labelText: "Caption",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                onPressed: (){
                  
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