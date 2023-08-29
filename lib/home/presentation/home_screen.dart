import 'package:flutter/material.dart';
import 'widgets/scaffold_body.dart';
import 'widgets/upload_method.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const ScaffoldBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              uploadMethod(context, isVideo: true);
            },
            child: const Icon(
              Icons.video_file,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FloatingActionButton(
            onPressed: () {
              uploadMethod(context);
            },
            child: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
