import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:storys/Model/blogger_storys.dart';
import 'package:storys/Pages/styles.dart';

class ViewBloggerStory extends StatefulWidget {
  const ViewBloggerStory({super.key});

  @override
  State<ViewBloggerStory> createState() => _ViewBloggerStoryState();
}

class _ViewBloggerStoryState extends State<ViewBloggerStory> {
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
    return SafeArea(
      child: FutureBuilder(
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
                  child: GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Text(
                        snapshot.data!.items[index].title,
                        style: headingTextStyle(),
                      ),
                      subtitle: Text(
                          snapshot.data!.items[index].content),
                    ),
                  ),
                );
              },
            );
          }
        }),);
  }
}
