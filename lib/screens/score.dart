import 'package:flutter/material.dart';
import 'scoresheet.dart';
import 'total.dart';

class TabbedAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        title: Text('Score'),
      ),
      body: _buildListViewWithGK(),
    );
  }

  ListView _buildListViewWithGK() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 5.0),
              Card(
                child: ListTile(
                    title: Text('Total'),
                    subtitle: Text('High Score'),
                    leading: Icon(Icons.person),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Total()));
                    }),
              ),
              Card(
                child: ListTile(
                    title: Text('CS'),
                    subtitle: Text('CS High Score'),
                    leading: Icon(Icons.computer),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoreSheet('CS')));
                    }),
              ),
              Card(
                child: ListTile(
                    title: Text('GK'),
                    subtitle: Text('GK High Score'),
                    leading: Icon(Icons.book),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoreSheet('GK')));
                    }),
              ),
              Card(
                child: ListTile(
                    title: Text('Maths'),
                    subtitle: Text('MAT High Score'),
                    leading: Icon(Icons.add),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoreSheet('MAT')));
                    }),
              ),
              Card(
                child: ListTile(
                    title: Text('English'),
                    subtitle: Text('ENG High Score'),
                    leading: Icon(Icons.nightlife),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoreSheet('ENG')));
                    }),
              ),
            ],
          );
        });
  }
}
