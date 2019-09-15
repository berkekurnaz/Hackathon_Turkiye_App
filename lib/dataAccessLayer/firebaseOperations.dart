import 'package:firebase_database/firebase_database.dart';

class FirebaseOperations {
  final databaseReference =
      FirebaseDatabase.instance.reference().child("hackathons");

  Future<List> getHackathonList(List hackathonList) async{
      await databaseReference.once().then((DataSnapshot snapshot) {
        hackathonList = snapshot.value;
        hackathonList.sort((a, b) => a["date"].compareTo(b["date"]));
        hackathonList = hackathonList.where((i) => i["date"] > DateTime.now().millisecondsSinceEpoch).toList();
      });
      return hackathonList;
  }

  Future<List> getOldHackathonList(List hackathonList) async{
      await databaseReference.once().then((DataSnapshot snapshot) {
        hackathonList = snapshot.value;
        hackathonList.sort((a, b) => a["date"].compareTo(b["date"]));
        hackathonList = hackathonList.reversed.where((i) => i["date"] < DateTime.now().millisecondsSinceEpoch).toList();
      });
      return hackathonList;
  }


}
