import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  var controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "More",
          style: TextStyle(fontSize: 18),
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
            Uri.parse("https://www.togoparts.com/marketplace/create"),
          ),
      ),
    );
  }
}
