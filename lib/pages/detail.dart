import 'package:flutter/material.dart';
import 'package:hackathon_turkiye/components/scaleRoute.dart';
import 'package:hackathon_turkiye/layout/myAppBar.dart';
import 'package:hackathon_turkiye/models/hackathon.dart';

import 'detailurl.dart';

class Detail extends StatefulWidget {
  String image;
  String title;
  String description;
  String date;
  String url;

  Detail({this.image, this.title, this.description, this.date, this.url});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network("${widget.image}"),
              SizedBox(
                height: 15,
              ),
              Text(
                "${widget.title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Container(
                  color: Colors.black,
                  height: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon((Icons.date_range)),
                  Text(
                    " ${widget.date}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                child: Text(
                  "${widget.description}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: Colors.blue,
                padding:
                    EdgeInsets.only(right: 30, left: 30, bottom: 12, top: 12),
                child: Text(
                  "Detayları İncele",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailUrl(
                              url: "${widget.url}",
                            )),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDemoScreen extends StatelessWidget { 
  
  final databaseReference = FirebaseDatabase.instance.reference();  

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
            title: Text('Firebase Connect'),
            ),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[                  RaisedButton(
                      child: Text('Create Record'),
                      onPressed: () {
                        createRecord();
                      },
                  ),                  RaisedButton(
                      child: Text('View Record'),
                      onPressed: () {
                        getData();
                      },
                  ),
                  RaisedButton(
                      child: Text('Udate Record'),
                      onPressed: () {
                        updateData();
                      },
                  ),
                  RaisedButton(
                      child: Text('Delete Record'),
                      onPressed: () {
                        deleteData();
                      },
                  ),
                ],
            )
        ), //center
    );
  }  
  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }  

}
*/
