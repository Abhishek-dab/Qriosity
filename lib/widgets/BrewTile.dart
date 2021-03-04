import 'package:flutter/material.dart';
import 'package:quizzler/scoreC.dart';

class BrewTile extends StatelessWidget {
  final Scores brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    String nam = brew.name;
    nam = nam.substring(0, brew.name.indexOf('@'));

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('$nam'),
          subtitle: Text('${brew.marks}'),
        ),
      ),
    );
  }
}
