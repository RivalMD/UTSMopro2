import 'package:flutter/material.dart';

class Menu2Page extends StatelessWidget {
  final List<Map<String, String>> articles;
  final Function(int) onDeleteArticle;

  const Menu2Page({super.key, required this.articles, required this.onDeleteArticle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.article, color: Colors.red),
          title: Text(articles[index]['title']!),
          subtitle: Text(articles[index]['subtitle']!),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              onDeleteArticle(index); // Panggil callback untuk menghapus artikel
            },
          ),
        );
      },
    );
  }
}
