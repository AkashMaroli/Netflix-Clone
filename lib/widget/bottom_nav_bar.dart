import 'package:flutter/material.dart';

import 'package:netflixclonesecond/screen/home_screen.dart';
import 'package:netflixclonesecond/screen/more_screen.dart';
import 'package:netflixclonesecond/screen/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "New & Hot",
              )
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
          ),
        ),
        body:  TabBarView(
            children: [HomeScreen(), SearchScreen(), MoreScreen()]),
      ),
    );
  }
}
