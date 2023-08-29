import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storys/Model/blogpost.dart';

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
        _formKey.currentState!.reset();
      } else {
        _showSnackbar('Error saving post');
      }
    }
  }

  Future<http.Response> postBlogData() async {
    // final url = 'http://itspearls.mooo.com/stories/mystorys'; // Replace with your Postman API URL
    const url = 'http://itspearls.mooo.com/stories/mystorys';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'heading': _blogPost.heading,
      'blogBody': _blogPost.body,
      'image': _blogPost.image,
      'lessons': _blogPost.lessons,
    });

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
        title: const Text('Create Blog Post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Heading (max 50 words)'),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blog Body (max 2000 words)'),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Lessons (max 300 words)'),
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
// Please replace 'YOUR_API_URL_HERE' with the actual URL of your Postman API. This code will handle the API request when the "Post" button is pressed and show a snackbar to indicate whether the post was saved successfully or if there was an error. Make sure you've included the necessary http package in your pubspec.yaml file:
//
// yaml
// Copy code
// dependencies:
// flutter:
// sdk: flutter
// http: ^0.13.3 # Example version, check for the latest version
// Remember to handle API errors, loading indicators, and possibly implement more robust error handling mechanisms in a real-world scenario.






