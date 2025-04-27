import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();
  String text = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Tulis disini"
            ),
            onSubmitted: (str){
              setState(() {
                text = "$str\n$text";
                textController.text = "";
              });
            },
          ),
          Text(text)
        ],
      ),
    );
  }
}