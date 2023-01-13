import 'package:flutter/material.dart';
import 'package:web_view/screens/fifth_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

List<String> list = <String>['MarketPlace', 'Bike Shop'];

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({Key? key}) : super(key: key);

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  @override
  String dropdownValue = list.first;
  late List<String> url = ["https://www.togoparts.com/marketplace/browse"];

  var controller = WebViewController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: DropdownButton<String>(
          value: dropdownValue,
          elevation: 16,
          style: TextStyle(color: Colors.green),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
                        );
          }).toList(),
        ),
        actions: [
          ImageIcon(AssetImage("images/notification_icon_inactive@1x.png"),),
          SizedBox(
            width: 20,
          ),
          ImageIcon(AssetImage("images/inbox icon.png")),
          SizedBox(
            width: 20,
          ),
          ImageIcon(AssetImage("images/options_icon_inactive@1x.png")),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller
          ..loadRequest(
            Uri.parse("https://www.togoparts.com/marketplace/browse"),
          ),
      ),
    );
    ;
  }
}
