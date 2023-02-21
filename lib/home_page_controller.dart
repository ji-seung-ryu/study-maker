
import 'package:study_maker/home_screen.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePageController extends StatefulWidget {
  static String id = '/HomePageController';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageController> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
       AppBar(
          title: Text('hi'),
          actions: [

            new Builder(

                builder: (context) => IconButton(
                  icon: Icon(Icons.add_alert_rounded),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                )),
      ]),
      endDrawer: Drawer(
        width: double.infinity,
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tom Cruise',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'tomcruise@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
              },
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close Drawer', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      */

      body: _widgetOptions[_selectedIndex],

      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  List<Widget> _widgetOptions = [
    HomePage(),
    ChatPage(),
    Text(
      'Places',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
  ];

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(

      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: _selectedIndex,
      //현재 선택된 Index
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Chat',
          icon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          label: 'My',
          icon: Icon(Icons.account_box_rounded),
        ),
      ],
    );
  }

}

