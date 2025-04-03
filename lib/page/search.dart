import 'package:flutter/material.dart';

void main() => runApp(const Search());

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 40,),
              Text("Search", style: TextStyle(fontSize: 30),)
            ],
          )
      );
    }
}