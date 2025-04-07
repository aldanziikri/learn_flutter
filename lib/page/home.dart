import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> data;
  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.widgets),
              title: Text(data[index]),
            );
          },
    );
  }
}