import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/ui/popular_movies_page.dart';
import 'package:flutter_sample_app/presentation/ui/top_rated_page.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _bottomBarItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = <Widget>[
    PopularMoviesPage(),
    TopRatedMoviesPage(),
  ];

  static const bottomBarItems = <BottomNavigationBarItem>[
    PopularMoviesPage.bottomBarItem,
    TopRatedMoviesPage.bottomBarItem,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItems,
        currentIndex: _selectedIndex,
        onTap: _bottomBarItemSelected,
      ),
    );
  }
}
