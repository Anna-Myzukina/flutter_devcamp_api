import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  var url = 'https://jsonplaceholder.typicode.com';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$url/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => PostModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<PostModel> createPost(PostModel post) async {
    try {
      final response = await http.post(
        Uri.parse('$url/posts'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(post.toJson()),
      );

      if (response.statusCode == 201) {
        return PostModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Failed to create post: ${response.statusCode} ${response.body}',
        );
      }
    } catch (e) {
      debugPrint('Error! ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  Future<PostModel> updatePost(int id, PostModel post) async {
    final response = await http.put(
      Uri.parse('$url/posts/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(
      Uri.parse('$url/posts/$id'),
    );

    if (response.statusCode == 200) {
      print('Post deleted');
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
