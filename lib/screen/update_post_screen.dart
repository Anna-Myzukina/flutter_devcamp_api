import 'package:flutter/material.dart';
import '../normal_http/api/post_service.dart';
import '../normal_http/model/post_model.dart';

class UpdatePostScreen extends StatefulWidget {
  final PostModel post;

  const UpdatePostScreen({super.key, required this.post});

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  final PostService postService = PostService();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
    _bodyController = TextEditingController(text: widget.post.body);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                PostModel updatedPost = PostModel(
                  id: widget.post.id,
                  title: _titleController.text,
                  body: _bodyController.text,
                  userId: 1,
                );
                try {
                  await postService.updatePost(widget.post.id, updatedPost);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}