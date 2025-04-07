import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List dataJSON = [];
  Future getData() async {
    http.Response hasil = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"), 
      headers:{ "Accept": "application/json"}
      );

    setState((){
      dataJSON = json.decode(hasil.body);
    });
  }
  @override
  void initState() {
    super.initState(); // WAJIB!
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: dataJSON.length,
        itemBuilder: (context, index) {
          return Card(
            child:(
                Text(dataJSON[index]["title"])
              ),
          );
        },
      ),
    );
  }
}