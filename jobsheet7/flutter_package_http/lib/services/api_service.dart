import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  // Switch this when deploying or testing locally
  // For Android Emulator targeting local Laravel: 'http://10.0.2.2:8000/api'
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Helper method to parse errors into user-friendly text
  void _handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw Exception('Bad Request. Please check your submitted data.');
      case 401:
      case 403:
        throw Exception('Unauthorized. You do not have permission to do this.');
      case 404:
        throw Exception('The requested post was not found.');
      case 500:
        throw Exception('Server error. Our team has been notified. Please try again later.');
      default:
        throw Exception('Something went wrong (Error ${response.statusCode}).');
    }
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/posts'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => Post.fromJson(e)).toList();
      }
      _handleError(response);
      return [];
    } on SocketException {
      throw Exception('No Internet connection. Please check your network.');
    }
  }

  Future<Post> createPost(String title, String body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
      );
      if (response.statusCode == 201) {
        return Post.fromJson(jsonDecode(response.body));
      }
      _handleError(response);
      throw Exception('Unexpected error occured.');
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

  // Generic PATCH method
  Future<Post> patchPost(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {

      debugPrint('PATCH REQUEST START');
      debugPrint('ID: $id');
      debugPrint('BODY: ${jsonEncode(data)}');


      final response = await http.patch(
        Uri.parse('$baseUrl/posts/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );


      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        return Post.fromJson(
          jsonDecode(response.body),
        );
      }

      _handleError(response);
        throw Exception('Unexpected error occurred.');

      } on SocketException {

        debugPrint('NO INTERNET CONNECTION');

        throw Exception('No Internet connection.');
      } catch (e) {

        debugPrint('PATCH ERROR: $e');

        rethrow;
      }
    //   _handleError(response);
    //   throw Exception('Unexpected error occurred.');
    // } on SocketException {
    //   throw Exception('No Internet connection.');
    // }
  }

  Future<void> deletePost(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/$id'),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 204) {
        return;
      }

      _handleError(response);
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

}


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/post.dart';

// class ApiService {
//   static const String baseUrl = 'https://jsonplaceholder.typicode.com';

//   Future<List<Post>> fetchPosts() async {
//     final response = await http
//       .get(Uri.parse('$baseUrl/posts'))
//       .timeout(const Duration(seconds: 10));
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body);
//       return data.map((e) => Post.fromJson(e)).toList();
//     }

//     throw Exception('Failed to fetch posts: ${response.statusCode}');
//   }

//   Future<Post> createPost(String title, String body) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/posts'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
//     );
//     if (response.statusCode == 201) {
//       return Post.fromJson(jsonDecode(response.body));
//     }
    
//     throw Exception('Failed to create post: ${response.statusCode}');
//   }

//   Future<Post> updatePostTitle(int id, String title) async {
//     final response = await http.patch(
//       Uri.parse('$baseUrl/posts/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'title': title}),
//     );
//     if (response.statusCode == 200) {
//       return Post.fromJson(jsonDecode(response.body));
//       }
//     throw Exception('Failed to update post: ${response.statusCode}');
//   }
//   Future<void> deletePost(int id) async {
//     final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));
//     if (response.statusCode == 200 || response.statusCode == 204) {
//       return;
//     }
//     throw Exception('Failed to delete post: ${response.statusCode}');
//   }
// }