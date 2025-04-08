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
      final hasil = await http.get(
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
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: dataJSON.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 20),
                child:  Column(
                  children: [
                    Text(dataJSON[index]["title"], textAlign: TextAlign.left, style: TextStyle(fontSize: 16 ,color: const Color.fromARGB(255, 14, 65, 106)),),
                    Text(dataJSON[index]["body"], textAlign: TextAlign.left)
                  ],
                )
                )
          );
        },
      ),
    );
  }
}