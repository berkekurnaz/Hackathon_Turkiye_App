import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/layout/myDrawerMenu.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: WebviewScaffold(
          url: "https://medium.com/hackathonturkiye",
          withJavascript: true,
          withLocalStorage: true,
          initialChild: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )),
        ),
      ),
    );
  }
}