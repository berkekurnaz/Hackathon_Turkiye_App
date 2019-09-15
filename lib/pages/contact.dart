import 'package:flutter/material.dart';
import 'package:hackathon_turkiye/components/scaleRoute.dart';

import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/layout/myDrawerMenu.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon_turkiye/pages/about.dart';
import 'package:hackathon_turkiye/pages/home.dart';
import 'package:hackathon_turkiye/pages/old.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String strAbout =
      "Türkiye’de düzenlenen hackathonları takip ediyor ve paylaşıyoruz. Websitemizden de yeni düzenlenecek hackathonları takip edebilirsiniz.";

  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _showPage(_selectedIndex);
  }

  void _showPage(int selectedPage) {
    if (selectedPage == 0) {
      Navigator.push(
        context,
        ScaleRoute(page: Home()),
      );
    } else if (selectedPage == 1) {
      Navigator.push(
        context,
        ScaleRoute(page: Old()),
      );
    } else if (selectedPage == 2) {
      Navigator.push(
        context,
        ScaleRoute(page: About()),
      );
    } else if (selectedPage == 3) {
      // Bu Sayfada Oldugumuz Icin Islem Yapma
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Geçmiş'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('Nedir ?'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('İletişim'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: Image.asset(
              "assets/images/building.gif",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "İletişim",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Container(
              color: Colors.black,
              height: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Text(
              "$strAbout",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Text(
              "Mail: hackathonturkiye@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Sosyal Medya",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Container(
              color: Colors.black,
              height: 2,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _launchFacebook();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(FontAwesomeIcons.facebook,
                      color: Colors.black, size: 35),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchTwitter();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(FontAwesomeIcons.twitter,
                      color: Colors.black, size: 35),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchLinkedin();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(FontAwesomeIcons.linkedin,
                      color: Colors.black, size: 35),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchWebsite();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(FontAwesomeIcons.weebly,
                      color: Colors.black, size: 35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _launchFacebook() async {
    const url = 'https://www.facebook.com/Hackathon-T%C3%BCrkiye-920939078056993/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTwitter() async {
    const url = 'https://twitter.com/turkeyhackathon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchLinkedin() async {
    const url = 'https://www.linkedin.com/company/hackathon-turkiye/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWebsite() async {
    const url = 'https://hackathonturkiye.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
