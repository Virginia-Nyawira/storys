import 'package:flutter/material.dart';
import 'package:storys/Pages/Blogger_storys.dart';
import 'package:storys/Pages/homepage.dart';
import 'package:storys/Pages/post_story.dart';
import 'package:storys/Pages/styles.dart';

import 'create_post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome!',style: headingTextStyle(),),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.white38,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Text(
                "Read",
                style: headingTextStyle().copyWith(color: Colors.teal),
              ),
            ),
          ),
          Card(
            color: Colors.white38,
            child: TextButton(
              onPressed: () {
                ///To posting page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BlogPostForm()));
              },
              child: Text(
                "Post",
                style: headingTextStyle().copyWith(color: Colors.teal),
              ),
            ),
          ),
          Card(
            color: Colors.white38,
            child: TextButton(
              onPressed: () {
                ///To posting page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BloggerPosts()));
              },
              child: Text(
                "My Posts",
                style: headingTextStyle().copyWith(color: Colors.teal),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
