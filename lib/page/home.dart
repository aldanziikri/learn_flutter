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
  Future<List> fetchPosts() async {
    final response = await http.get(
      Uri.parse("http://192.168.100.235:8000/api/v1/posts"),
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer 1|LM7OHpYu5pR2Gl5ygem6wGz6nuG50AASLYq2n8zU016d5822",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['posts'];
    } else {
      throw Exception(
        "gagal mengambil data, status code : ${response.statusCode}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Terjadi kesalahan"));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("Data kosong"));
        }

        final posts = snapshot.data!;

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(
              title: Text(
                "Artikel by: ${post["user"]["full_name"] ?? "No Caption"}",
              ),
              subtitle: Text(post["caption"]),
            );
          },
        );
      },
    );
  }
}
