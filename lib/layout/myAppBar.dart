import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      elevation: 15,
      title: Text(
        "Hackathon Türkiye",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}