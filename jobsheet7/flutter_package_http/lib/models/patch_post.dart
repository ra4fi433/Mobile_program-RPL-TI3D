import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

Future<Post> patchPost(
  int id,
  String title,
  String body,
) async {

  final response = await http.patch(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to patch post');
  }
}