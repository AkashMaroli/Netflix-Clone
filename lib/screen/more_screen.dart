import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: const SingleChildScrollView(
          child: Column(children: [
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              title: Text('No History',style: TextStyle(color: Colors.white)),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined,color: Colors.white),
              title: Text('My List',style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.language,color: Colors.white),
              title: Text('Language',style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.white),
              title: Text('Settings',style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.star_border_purple500_rounded,color: Colors.white),
              title: Text('Rate this app',style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
            ),
            Divider(
              height: 10,
              thickness: 10,
              color: Colors.black45,
            ),
          ]),
        ),
      ),
    );
  }
}
