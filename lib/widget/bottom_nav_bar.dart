import 'package:flutter/material.dart';

import 'package:netflixclonesecond/screen/home_screen.dart';
import 'package:netflixclonesecond/screen/more_screen.dart';
import 'package:netflixclonesecond/screen/new_&_hot.dart';
import 'package:netflixclonesecond/screen/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                icon: Icon(Icons.photo_library_rounded),
                text: "New&hot",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              )
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
          ),
        ),
        body:  TabBarView(
            children: [HomeScreen(), SearchScreen(),NewAndHotScreen(), MoreScreen()]),
      ),
    );
  }
}
