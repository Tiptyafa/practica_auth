import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];
}

Future<Post> fetchPost(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Загрузка из сети',
          style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder<Post>(
          future: fetchPost(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return PostItem(post: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              post.title,
              style: const TextStyle(fontSize: 30, color: Colors.green),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              post.body,
              style: const TextStyle(fontSize: 20, color: Colors.orangeAccent),
            ),
          ),
        ],
      ),
    );
  }
}