import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/firebaase/database.dart';
import 'package:quizzler/scoreC.dart';

class Total extends StatefulWidget {
  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userss>>.value(
      value: DatabaseService().func(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff392850),
          title: Text('Total'),
        ),
        body: ScoreList(),
      ),
      //catchError: (_, err) => print(""),
    );
  }
}

class ScoreList extends StatefulWidget {
  @override
  _ScoreListState createState() => _ScoreListState();
}

class _ScoreListState extends State<ScoreList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Userss>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewsTile(brew: brews[index]);
      },
    );
  }
}

class BrewsTile extends StatelessWidget {
  final Userss brew;

  BrewsTile({this.brew});

  @override
  Widget build(BuildContext context) {
    String nam = brew.name;
    nam = nam.substring(0, brew.name.indexOf('@'));
    int cnt = brew.gk + brew.cs + brew.eng + brew.mat;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('$nam'),
          subtitle: Text('${brew.total}'),
          trailing: Text('Attempted: $cnt'),
        ),
      ),
    );
  }
}
