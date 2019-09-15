import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class HackathonCard extends StatelessWidget {
  String image;
  String title;
  String date;

  HackathonCard({this.image, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15, right: 5, left: 5),
      shape: Border.all(
        width: 0.2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SpinKitRipple(
                        color: Colors.black,
                        size: 12.0,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: '$image',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "$date",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
