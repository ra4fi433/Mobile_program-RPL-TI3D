import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'models/post.dart';
import 'services/api_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HTTP Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostsPage(),
    );
  }
}

 class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final api = ApiService();
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = api.fetchPosts();
  }

  void refresh() {
    setState(() => futurePosts = api.fetchPosts());
  }

  // Dialog method to get a new title input from the user for the PATCH request
  void _showEditTitleDialog(Post post) {
  final controller =
      TextEditingController(text: post.title);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Update Title'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'New Title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          child: const Text('Update'),
          onPressed: () async {

          debugPrint('UPDATE BUTTON CLICKED');

          Navigator.pop(context);

          try {

            final updatedPost = await api.patchPost(
              post.id,
              {
                'title': controller.text,
              },
            );

            debugPrint('PATCH SUCCESS');

            final currentPosts = await futurePosts;

            final updatedPosts = currentPosts.map((p) {
              return p.id == post.id
                  ? p.copyWith(
                      title: updatedPost.title,
                    )
                  : p;
            }).toList();

            setState(() {
              futurePosts = Future.value(updatedPosts);
            });

          } catch (e) {

            debugPrint('PATCH ERROR');
            debugPrint(e.toString());

          }
        },
      
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter HTTP Lab'),
        actions: [
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await api.createPost('New Title', 'New Body');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('POST success')),
              );
              refresh();
            }
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
              );
            }
          }
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // Clean up the string formatting for the user
            final userFriendlyError = snapshot.error.toString().replaceAll('Exception: ', '');
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 48),
                    const SizedBox(height: 8),
                    Text(userFriendlyError, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: refresh, child: const Text('Retry')),
                  ],
                ),
              ),
            );
          }

          final posts = snapshot.data ?? [];
          if (posts.isEmpty) return const Center(child: Text('No posts found'));

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Added PATCH Action Button
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showEditTitleDialog(post),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        try {
                          await api.deletePost(post.id);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('DELETE success')),
                            );
                            refresh();
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
