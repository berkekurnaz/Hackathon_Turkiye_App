import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon_turkiye/components/scaleRoute.dart';
import 'package:hackathon_turkiye/pages/about.dart';
import 'package:hackathon_turkiye/pages/addHackathon.dart';
import 'package:hackathon_turkiye/pages/blog.dart';
import 'package:hackathon_turkiye/pages/contact.dart';
import 'package:hackathon_turkiye/pages/home.dart';
import 'package:hackathon_turkiye/pages/old.dart';

class MyDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 125,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Geçmiş Hackathonlar'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: Old()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Hackathon Nedir ?'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: About()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Hackathon Kaydet'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: AddHackathon()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Blog'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: Blog()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                ScaleRoute(page: Contact()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.call_missed_outgoing),
            title: Text('Çıkış'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
