//AIzaSyCziQ9QNtU_YYz0f7ZUxCoqv9qvyEHBbF0 - api key
//Blogger ID- 956278707359124438
// OAuth 2.0-client secret- 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
// OAuth 2.0-Client ID - 483224933601-6ig7vjvln8fcshoetkpi0k5podffdo98.apps.googleusercontent.com
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:storys/Model/blogger_storys.dart';
import 'package:http/http.dart' as http;

class BloggerPosts extends StatefulWidget {
  const BloggerPosts({super.key});

  @override
  State<BloggerPosts> createState() => _BloggerPostsState();
}

class _BloggerPostsState extends State<BloggerPosts> {
  //List<BloggerStorys>? posts;
  //Enter Your API key
  final String apiKey = 'AIzaSyCziQ9QNtU_YYz0f7ZUxCoqv9qvyEHBbF0';
  //Enter your Blog Id here
  final String blogId = '956278707359124438';

  //Function for Fetching Posts
  Future<BloggerStorys> fetchPosts() async {
    var postListUrl = Uri.https(
        "blogger.googleapis.com", "/v3/blogs/$blogId/posts/", {"key": apiKey});
    final response = await http.get(postListUrl);
    if (response.statusCode == 200) {
      return BloggerStorys.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        // : null,
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data!.items[index].title,
                      ),
                      subtitle: Text(
                          snapshot.data!.items[index].author.displayName),
                    ),
                  );
                },
              );
            }
          }),
    );


  }
}


