import 'package:chagro/screens/book_list_screen.dart';
import 'package:chagro/screens/chart_screen.dart';
import 'package:chagro/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2ECDD),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            label: '차트',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: '내 정보'),
        ],
      ),
      body: <Widget>[
        const BookListScreen(),
        const ChartScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
