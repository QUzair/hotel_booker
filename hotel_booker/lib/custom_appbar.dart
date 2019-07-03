import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CustomAppBar extends StatefulWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  CustomAppBar() {
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(
          'Explore',
          style: TextStyle(color: Colors.white),
        )));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        title: Text(
          'Watchlist',
          style: TextStyle(color: Colors.white),
        )));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.white,
        ),
        title: Text(
          'Deals',
          style: TextStyle(color: Colors.white),
        )));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        )));
  }

  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffff6337),
      items: widget.bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
