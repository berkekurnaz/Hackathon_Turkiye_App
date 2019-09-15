import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_turkiye/components/hackathonCard.dart';
import 'package:hackathon_turkiye/components/scaleRoute.dart';
import 'package:hackathon_turkiye/dataAccessLayer/firebaseOperations.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/layout/myDrawerMenu.dart';
import 'package:hackathon_turkiye/pages/about.dart';
import 'package:hackathon_turkiye/pages/contact.dart';
import 'package:hackathon_turkiye/pages/detail.dart';
import 'package:hackathon_turkiye/pages/home.dart';

class Old extends StatefulWidget {
  @override
  _OldState createState() => _OldState();
}

class _OldState extends State<Old> {

  List hackathonList;
  FirebaseOperations firebase;

  int _selectedIndex = 1;
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
    }
    else if (selectedPage == 1) {
      // Bu Sayfada Oldugumuz Icin Islem Yapma
    }
    else if (selectedPage == 2) {
      Navigator.push(
        context,
        ScaleRoute(page: About()),
      );
    }
    else if (selectedPage == 3) {
      Navigator.push(
        context,
        ScaleRoute(page: Contact()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    hackathonList = new List();

    firebase = new FirebaseOperations();
    firebase.getOldHackathonList(hackathonList).then((value) {
      setState(() {
        hackathonList = value;
      });
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          ScaleRoute(
              page: Detail(
            image: "${hackathonList[index]["imageUrl"]}",
            title: "${hackathonList[index]["name"]}",
            description: "${hackathonList[index]["description"]}",
            date: convertDate(hackathonList[index]["date"]),
            url: "${hackathonList[index]["url"]}",
          )),
        );
      },
      child: HackathonCard(
        image: "${hackathonList[index]["imageUrl"]}",
        title: "${hackathonList[index]["name"]}",
        date: convertDate(hackathonList[index]["date"]),
      ),
    );
  }

  String convertDate(int timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String strDate = formatDate(date, [dd, '.', mm, '.', yyyy]);
    return strDate;
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
      body: hackathonList.length > 0 ? listScreen() : loading(),
    );
  }
  
  Widget listScreen() {
    return Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          itemBuilder: _buildProductItem,
          itemCount: hackathonList.length,
        ),
    );
  }

  Widget loading() {
    return Center(
        child: SpinKitRipple(
            color: Colors.black,
            size: 50.0,
          ),
    );
  }

}