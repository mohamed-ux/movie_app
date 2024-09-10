import 'package:flutter/material.dart';
import 'package:movie_app/features/browser/browser_screen.dart';
import 'package:movie_app/features/watch_list/watch_list_screen.dart';

import '../features/home/home_screen.dart';
import '../features/search/search_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName='layout';
   HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Home.png'),
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Group 29.png'),
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Icon material-movie.png'),
              ),
              label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Icon ionic-md-bookmarks.png'),
              ),
              label: 'WATCHLIST'),
        ],
      ),
      body: screenWidgets[selectedIndex],
    );
  }

  List<Widget> screenWidgets = [
    HomeScreen(),
    SearchScreen(),
    BrowserScreen(),
    WatchListScreen(),
  ];
}
