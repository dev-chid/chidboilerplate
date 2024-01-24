import 'package:chidboilerplate/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<MainCategory> data = [
    MainCategory('zero', SubCategory(['one', 'two'])),
    MainCategory('one', SubCategory(['three', 'four'])),
  ];

  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].mainCategory),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Subcategories:'),
                for (String item in data[index].subCategory.items)
                  Text('- $item'),
              ],
            ),
          );
        },
      ),
    );
  }
}
