import 'dart:convert';

import 'Post.dart';
import 'package:http/http.dart' as http;

const base_url = "https://jsonplaceholder.typicode.com";

Future<Post> fetchPost() async {
  final response = await http.get(base_url + '/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
