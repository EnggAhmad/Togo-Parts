import 'package:flutter/material.dart';
import 'package:web_view/bottom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FifthScreen extends StatelessWidget {
  FifthScreen({Key? key, required this.url}) : super(key: key);
  late String url;
  var controller = WebViewController();

  Future <void> refresh(){
    return Future.delayed(Duration(seconds: 0));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () async {
                    if (await controller.canGoBack()) {
                      await controller.goBack();
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No back history item')),
                      );}
                  },

                ),
              ),
              RefreshIndicator(
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
                      Uri.parse(url),
                    ),
                ),
              ),
            ],
            )


            ),
      ),
    );
  }
}
