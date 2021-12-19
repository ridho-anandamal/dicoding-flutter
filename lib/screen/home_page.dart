import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/screen/home/list_page.dart';
import 'package:submission_restaurant/screen/home/favorite_page.dart';
import 'package:submission_restaurant/screen/home/settings_page.dart';
import 'dart:io' show Platform;
import 'package:submission_restaurant/widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listPage = [
    const ListPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(
            Platform.isIOS ? CupertinoIcons.tags_solid : Icons.local_offer),
      ),
      label: ListPage.pageName,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(Platform.isIOS
            ? CupertinoIcons.heart_solid
            : Icons.favorite_rounded),
      ),
      label: FavoritePage.pageName,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      ),
      label: SettingsPage.pageName,
    ),
  ];

  void _onBottomNavtapped(int index) {
    setState(() => _bottomNavIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listPage[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavbarItems,
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavtapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: _bottomNavbarItems),
      tabBuilder: (context, index) => _listPage[index],
    );
  }
}
