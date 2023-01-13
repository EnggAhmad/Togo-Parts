import 'package:flutter/material.dart';
import 'package:web_view/screens/fifth_screen.dart';
import 'package:web_view/screens/post_ad_url_fourth_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

List<String> list = <String>[
  'My Challenges',
  'Current Challenges',
  'Future Challenges'
];
class TrideScreen extends StatefulWidget {
  const TrideScreen({Key? key}) : super(key: key);

  @override
  State<TrideScreen> createState() => _TrideScreenState();
}

class _TrideScreenState extends State<TrideScreen> {
  @override
  String dropdownValue = list.first;

  var controller = WebViewController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
        child: DropdownButton(
            value: dropdownValue,
            elevation: 16,
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: TextStyle(color: Colors.black),),
              );
            }).toList(),
          ),
        ),
        actions: [
          ImageIcon(AssetImage("images/notification_icon_inactive@1x.png")),
          SizedBox(
            width: 20,
          ),
          ImageIcon(AssetImage("images/inbox icon.png")),
          SizedBox(
            width: 20,
          ),
          ImageIcon(AssetImage("images/options_icon_inactive@1x.png")),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller
          ..loadRequest(
            Uri.parse("https://www.togoparts.com/bikeprofile/trides"),

          ),
      ),
    );
  }
}
