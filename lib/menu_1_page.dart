 import 'package:flutter/material.dart';

class Menu1Page extends StatelessWidget {
  final List<Map<String, String>> articles;
  final Function(Map<String, String>) onAddArticle;

  const Menu1Page({Key? key, required this.articles, required this.onAddArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();

    void _addArticle() {
      final String title = titleController.text.trim();
      final String subtitle = subtitleController.text.trim();
      if (title.isNotEmpty && subtitle.isNotEmpty) {
        onAddArticle({'title': title, 'subtitle': subtitle});
        Navigator.pop(context); // Tutup dialog
      }
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.article, color: Colors.blue),
                title: Text(articles[index]['title']!),
                subtitle: Text(articles[index]['subtitle']!),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Tambah Berita'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(labelText: 'Judul'),
                        ),
                        TextField(
                          controller: subtitleController,
                          decoration: const InputDecoration(labelText: 'Deskripsi'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: _addArticle,
                        child: const Text('Simpan'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Tambah Berita'),
          ),
        ),
      ],
    );
  }
}
