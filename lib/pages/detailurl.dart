import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';

class DetailUrl extends StatefulWidget {
  String url;

  DetailUrl({this.url});

  @override
  _DetailUrlState createState() => _DetailUrlState();
}

class _DetailUrlState extends State<DetailUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WebviewScaffold(
          url: "${widget.url}",
          withJavascript: true,
          withLocalStorage: true,
          initialChild: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )),
          appBar: MyAppBar(),
        ),
      ),
    );
  }
}
