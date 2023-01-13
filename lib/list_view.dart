import 'package:flutter/material.dart';
import 'package:web_view/screens/fifth_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum SampleItem { Login, Switchcountry }

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> myList = [
    "Rides ",
    "Magzine",
    "Forum",
    "Bike Shop",
    "careers",
    "Advertiseon Togoparts",
    "About Togo Parts",
    "Terms of Services",
  ];
  List<String> image = [
    "more_options/rides_icon@1x.png",
    "more_options/magazine_icon@1x.png",
    "more_options/forum_icon@1x.png",
    "more_options/bike_shops_icon@1x.png",
    "more_options/bike_shops_icon@1x.png",
    "more_options/advertise_icon@1x.png",
    "more_options/about_icon@1x.png",
    "more_options/terms_services_icon@1x.png",
  ];
  List<String> url = [
    "https://www.togoparts.com/bikeprofile/trides",
    "https://www.togoparts.com/magazine/",
    "https://www.togoparts.com/bikeshops/list_shops.php?scid=1",
    "https://www.togoparts.com/bikeshops/list_shops.php?scid=1",
    "https://www.togoparts.com/pages/career.php",
    "https://docs.google.com/forms/d/e/1FAIpQLSep0JPX8N2-D4vfOHSouY8LYU1aIhH2svBRZQ0hZZgqYuXjTw/viewform",
    "https://www.togoparts.com/about",
    "https://www.togoparts.com/pages/tos.php"
  ];
  SampleItem? selectedMenu;
  var controller = WebViewController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            PopupMenuItem<SampleItem>(
              value: SampleItem.Login,
              child: ListTile(
                leading: ImageIcon(AssetImage("more_options/login_icon@1x.png")) ,// your icon
                title: Text("Login"),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.Switchcountry,
              child: ListTile(
                leading: ImageIcon(AssetImage("more_options/country_flag@1x.png")) ,// your icon
                title: Text("Switch Country"),
              ),
            ),

          ]
          )
    ],
        title: Text(
          "More",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
                title: Text(myList[index]),
                leading: Image.asset(image[index]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return FifthScreen(
                      url: url[index],
                    );
                  }));
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 12,
            );
          },
          itemCount: myList.length),
    );
  }
}
