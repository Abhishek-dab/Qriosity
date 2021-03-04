import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/main.dart';
import '../screens/score.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "GK",
    subtitle: "GK questions",
    event: "13 Questions",
    page: QuizPage(n: 1),
  );

  Items item2 = new Items(
    title: "CS",
    subtitle: "CS questions",
    event: "8 Questions",
    page: QuizPage(n: 2),
  );
  Items item3 = new Items(
    title: "MAT",
    subtitle: "Maths questions",
    event: "10 Questions",
    page: QuizPage(n: 3),
  );
  Items item4 = new Items(
    title: "ENG",
    subtitle: "English questions",
    event: "10 Questions",
    page: QuizPage(n: 4),
  );
  Items item5 = new Items(
    title: "High Score",
    subtitle: "Scores",
    event: "RankList",
    page: TabbedAppBarDemo(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.page));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        data.subtitle,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  Widget page;

  Items({this.title, this.subtitle, this.event, this.page});
}
