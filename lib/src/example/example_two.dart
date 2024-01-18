import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExampleTwo extends StatelessWidget {
  const ExampleTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed('settings'),
          ),
        ],
      ),
      body: const Center(
        child: Text("Hello World Two"),
      ),
    );
  }
}
