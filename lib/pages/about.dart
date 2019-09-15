import 'package:flutter/material.dart';
import 'package:hackathon_turkiye/components/scaleRoute.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/layout/myDrawerMenu.dart';
import 'package:hackathon_turkiye/pages/contact.dart';
import 'package:hackathon_turkiye/pages/home.dart';
import 'package:hackathon_turkiye/pages/old.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String strAbout =
      "Hackathon, hack ve marathon kelimelerinin birleşiminden oluşmaktadır. 1999 Haziran ayında OpenBSD geliştiricileri ve SUN pazarlama ekiplerinin birbirinden bağımsız düzenledikleri etkinlikler ile başladı. Daha sonra büyük teknoloji firmalarının da benzer etkinlikler düzenlemesi ile popülerliğe ulaştı. Facebook’un like butonu, phonegap vb. pek çok ürün hackathonlarda üretilen prototipler sayesinde hayata geçti. Yine Facebook, Spotify gibi öncü teknoloji şirketleri şirket içi hackathonlar düzenleyerek bunu bir şirket kültürü haline getirdiler.";

  String strAbout2 = "Hackathonlar yeni fikirler/ürünler yaratmak, marka/şirket tanıtımı ya da işe alımlar için düzenlenmektedir.";

  int _selectedIndex = 2;
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
      // Bu Sayfada Oldugumuz Icin Islem Yapma
    } else if (selectedPage == 3) {
      Navigator.push(
        context,
        ScaleRoute(page: Contact()),
      );
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
            "Hackathon Nedir ?",
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
              "$strAbout2",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
