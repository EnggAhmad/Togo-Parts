import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future <void> refresh(){
    return Future.delayed(Duration(seconds: 0));
  }


  var controller = WebViewController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: RefreshIndicator(
         onRefresh: refresh,
         strokeWidth: 5,
         color: Colors.blueAccent,
         displacement: 0,
         backgroundColor: Colors.blue,
         edgeOffset: 20,
         triggerMode: RefreshIndicatorTriggerMode.onEdge,
         child: WebViewWidget(
            controller: controller
              ..loadRequest(
                Uri.parse("https://www.togoparts.com/"),
              ),
          ),
       ),
      ),
    );
  }
}
