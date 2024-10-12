import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/screen/create_post_screen.dart';
import 'package:flutter_devcamp_api/screen/view_post_screen.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ViewPostsScreen(),
                  ),
                );
              },
              child: const Text('View Posts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreatePostScreen(),
                  ),
                );
              },
              child: const Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}