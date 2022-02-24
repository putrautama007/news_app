import 'package:flutter/material.dart';
import 'package:news_app/ui/favorite_news_page.dart';
import 'package:news_app/ui/news_list_page.dart';
import 'package:news_app/utils/strings/strings%20constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: IndexedStack(
          index: _bottomNavIndex,
          children: const [
            NewsListPage(),
            FavoriteNewsPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: _onBottomNavTapped,
          currentIndex: _bottomNavIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: StringConstants.news,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: StringConstants.favorite,
            ),
          ],
        ),
      ),
    );
  }
}
