import 'package:flutter/material.dart';
import 'package:hackathon_turkiye/pages/about.dart';
import 'package:hackathon_turkiye/pages/addHackathon.dart';
import 'package:hackathon_turkiye/pages/blog.dart';
import 'package:hackathon_turkiye/pages/contact.dart';
import 'package:hackathon_turkiye/pages/home.dart';
import 'package:hackathon_turkiye/pages/old.dart';
import 'package:hackathon_turkiye/pages/splash.dart';

void main(){
  runApp(
    MaterialApp(
      initialRoute: "/",
      theme: ThemeData(
        fontFamily: "Montserrat",
        accentColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Splash(),
        "/home": (context) => Home(),
        "/old": (context) => Old(),
        "/about": (context) => About(),
        "/addhackathon": (context) => AddHackathon(),
        "/blog": (context) => Blog(),
        "/contact": (context) => Contact(),
      },
    )
  );
}