import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storys/Model/blogpost.dart';
import 'package:storys/Pages/styles.dart';

class BlogPostForm extends StatefulWidget {
  const BlogPostForm({super.key});

  @override
  _BlogPostFormState createState() => _BlogPostFormState();
}

class _BlogPostFormState extends State<BlogPostForm> {
  final _formKey = GlobalKey<FormState>();
   final BlogPost _blogPost = BlogPost();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Process and submit the blog post data (e.g., send to a server)
      final response = await postBlogData();
      if (response.statusCode == 201) {
        _showSnackbar('Post saved successfully');
        debugPrint('Post saved successfully');
        _formKey.currentState!.reset();
      } else {
        _showSnackbar('Error saving post');
        debugPrint('Error saving post');
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    }
  }

  Future<http.Response> postBlogData() async {
    const url = 'http://itspearls.mooo.com/stories/mystorys';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'heading': _blogPost.heading,
      'image': _blogPost.image,
      'body': _blogPost.body,
      'lessons': _blogPost.lessons,
    });
    print('Request URL: $url');
    print('Request Body: $body');
    print('Request Headers: $headers');
    return await http.post(Uri.parse(url), headers: headers, body: body);
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Create Post',
         style: headingTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///Heading
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Heading (max 50 words)'),
                maxLength: 50,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Heading is required';
                  }
                  return null;
                },
                onChanged: (value) => _blogPost.heading = value,
              ),
              const SizedBox(height: 16.0),

              ///Image
              TextFormField(
                decoration:
                const InputDecoration(labelText: 'Image URL (max 300 words)'),
                maxLength: 300,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'url is required';
                  }
                  return null;
                },
                onChanged: (value) => _blogPost.image = value,
              ),
              const SizedBox(height: 16.0),
              ///Body
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Blog Body (max 2000 words)'),
                maxLength: 2000,
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Blog body is required';
                  }
                  return null;
                },
                onChanged: (value) => _blogPost.body = value,
              ),

              const SizedBox(height: 16.0),
              ///Lessons
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Lessons (max 300 words)'),
                maxLength: 300,
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lessons are required';
                  }
                  return null;
                },
                onChanged: (value) => _blogPost.lessons = value,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
