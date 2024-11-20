import 'package:flutter/material.dart';
import 'menu_1_page.dart';
import 'menu_2_page.dart';
import 'menu_3_page.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  List<Map<String, String>> articles = [
    {'title': 'Berita Teknologi', 'subtitle': 'Inovasi terbaru di dunia teknologi.'},
    {'title': 'Berita Olahraga', 'subtitle': 'Hasil pertandingan terbaru.'},
    {'title': 'Berita Hiburan', 'subtitle': 'Film dan musik terbaru minggu ini.'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Menu1Page(
        articles: articles,
        onAddArticle: (newArticle) {
          setState(() {
            articles.add(newArticle);
          });
        },
      ),
      Menu2Page(
        articles: articles,
        onDeleteArticle: (index) {
          setState(() {
            articles.removeAt(index);
          });
        },
      ),
      Menu3Page(username: widget.username),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Menambah Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Menghapus Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
