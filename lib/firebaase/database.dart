import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzler/scoreC.dart';

class DatabaseService {
  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(int marks, String subject, String name) async {
    QuerySnapshot l = await brewCollection
        .where('name', isEqualTo: name)
        .where('subject', isEqualTo: subject)
        .get();

    if (l.docs.length == 0) {
      return await brewCollection.add({
        "name": name,
        "subject": subject,
        "marks": marks,
      }).catchError((e) {
        print('22');
      });
    }
  }

  Future<void> addUserData(String mail, int score) async {
    return await FirebaseFirestore.instance.collection('scores').add({
      "name": mail,
      "tot": score,
      "CS": 0,
      "GK": 0,
      "MAT": 0,
      "ENG": 0,
    }).catchError((e) {
      print(e.toString());
    });
  }

  final CollectionReference cr =
      FirebaseFirestore.instance.collection('scores');

  Future<void> updateUsertot(int marks, String sub, String name) async {
    QuerySnapshot l = await cr
        .where('name', isEqualTo: name)
        .where('$sub', isEqualTo: 1)
        .get();

    if (l.docs.length == 0) {
      final QuerySnapshot searchedUserId =
          await cr.where('name', isEqualTo: name).limit(1).get();
      DocumentSnapshot document = searchedUserId.docs.first;
      final userDocId = document.id;

      int m = searchedUserId.docs.first["tot"];

      cr.doc(userDocId).update({sub: 1, 'tot': marks + m});
    }
  }

/*
  DocumentReference createUser() {
    return brewCollection.doc(uid);
  }*/

  List<Scores> _brewListFromSnapshot(QuerySnapshot snapshot) {
    //print(doc.data);

    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Scores(
        marks: doc.data()['marks'] ?? -1,
        name: doc.data()['name'] ?? '',
        subject: doc.data()['subject'] ?? '',
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Scores>> fun(String a) {
    // Stream<List<Scores>> get brews {
    Stream<List<Scores>> l;
    try {
      l = brewCollection
          .where('subject', isEqualTo: '$a')
          .orderBy('marks', descending: true)
          .snapshots()
          .map(_brewListFromSnapshot);
    } catch (e) {
      print('love');
    }
    return l;
    //}
  }

  List<Userss> _brewFromSnapshot(QuerySnapshot snapshot) {
    //print(doc.data);

    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Userss(
        name: doc.data()['name'] ?? "",
        total: doc.data()['tot'] ?? '',
        gk: doc.data()['GK'] ?? '',
        cs: doc.data()['CS'] ?? '',
        eng: doc.data()['ENG'] ?? '',
        mat: doc.data()['MAT'] ?? '',
      );
    }).toList();
  }

  Stream<List<Userss>> func() {
    Stream<List<Userss>> l;
    try {
      l = cr
          .orderBy('tot', descending: true)
          .snapshots()
          .map(_brewFromSnapshot);
    } catch (e) {
      print('love');
    }
    return l;
  }
}
