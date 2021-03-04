import 'package:flutter/material.dart';
import 'package:quizzler/widgets/scorelist.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/firebaase/database.dart';
import 'package:quizzler/scoreC.dart';

class ScoreSheet extends StatefulWidget {
  final String n;

  ScoreSheet(this.n);
  @override
  _ScoreSheetState createState() => _ScoreSheetState();
}

class _ScoreSheetState extends State<ScoreSheet> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Scores>>.value(
      value: DatabaseService().fun(widget.n),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff392850),
          title: Text('${widget.n}'),
        ),
        body: BrewList(),
      ),
      //catchError: (_, err) => print(""),
    );
  }
}
