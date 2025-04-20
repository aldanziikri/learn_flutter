import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:my_app/post/edit_post.dart';

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

  void deletePost(int id) async {
    final respon = await http.delete(
      Uri.parse("http://192.168.100.235:8000/api/v1/posts/$id"),
      headers: {
        "Accept": "application/json",
        'Authorization': "Bearer 1|LM7OHpYu5pR2Gl5ygem6wGz6nuG50AASLYq2n8zU016d5822"
      });
      if (!mounted) return;
      if (respon.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post berhasil dihapus")));
        await fetchPosts();
        setState(() {
        });
      }
      else{
        final output = jsonDecode(respon.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(output['message'])));
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,  // Menambahkan ini
                children: [
                  ElevatedButton(
                    onPressed: () {
                      deletePost(post['id']);
                    },
                    child: Icon(Icons.delete),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditPost(post: post)),
                      );
                    },
                    child: Icon(Icons.edit),
                  ),
                ],
              )
            );
          },
        );
      },
    );
  }
}
