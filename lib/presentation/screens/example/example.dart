import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Example extends StatelessWidget {
  const Example({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed('settings'),
          ),
        ],
      ),
      body: const Center(
        child: Text("Hello World One"),
      ),
    );
  }
}
