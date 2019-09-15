import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/layout/myDrawerMenu.dart';

class AddHackathon extends StatefulWidget {
  @override
  _AddHackathonState createState() => _AddHackathonState();
}

class _AddHackathonState extends State<AddHackathon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: WebviewScaffold(
          url: "https://docs.google.com/forms/d/e/1FAIpQLSfK9kgc62_sH6z4j8s_EG_eeQg0Vp_7m_4lz1q_F6vx95Lmxg/formrestricted",
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