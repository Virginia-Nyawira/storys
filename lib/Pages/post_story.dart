import 'package:flutter/material.dart';

class PostStory extends StatefulWidget {
  const PostStory({super.key});

  @override
  State<PostStory> createState() => _PostStoryState();
}

class _PostStoryState extends State<PostStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView(
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: "Heading",
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
                icon: Icon(Icons.add_task_rounded),
              ),
            ),
            TextField(
              maxLines: 15,
              decoration: InputDecoration(
                helperMaxLines: 15,
                labelText: "Body",
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
                icon: Icon(Icons.edit_document),
              ),
            ),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                helperMaxLines: 5,
                labelText: "Any lessons",
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
                icon: Icon(Icons.lightbulb_circle_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
