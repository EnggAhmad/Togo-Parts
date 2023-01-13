import 'package:flutter/material.dart';
import 'package:web_view/list_view.dart';
import 'package:web_view/screens/home_screen.dart';
import 'package:web_view/screens/marketplace_third_screen.dart';
import 'package:web_view/screens/post_ad_url_fourth_screen.dart';
import 'package:web_view/screens/trides.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int selectedIndex = 0;

  Future<void> refresh() {
    return Future.delayed(Duration(seconds: 0));
  }

  List<Widget> widgetsList = <Widget>[
    HomeScreen(),
    TrideScreen(),
    MarketPlace(),
    PostAdScreen(),
    MyListView(),
  ];
  var controller = WebViewController();
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/challenges_icon_active@2x.png")),
            label: "Challenge",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/profile_icon_inactive@1x.png"),
            ),
            label: "Me",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/marketplace_icon_inactive@1x.png"),
            ),
            label: "Market",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/more_icon_inactive@2x.png"),
            ),
            label: "More",
          ),
        ],
        onTap: (i) {
          setState(() => selectedIndex = i);
        },
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        strokeWidth: 10,
        color: Colors.blueAccent,
        displacement: 10,
        backgroundColor: Colors.blue,
        edgeOffset: 20,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: widgetsList[selectedIndex],
      ),
    );


  }
}
