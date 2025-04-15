import 'package:flutter/material.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({super.key, required this.name, required this.picture});
  final String name;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $name"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(picture),
            Text(name),
          ],
        ),
      ),
    );
  }
}