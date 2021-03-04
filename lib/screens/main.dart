import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../quiz_brain.dart';
import '../wrapper.dart';
import '../firebaase/auth.dart';
import '../user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizzler/firebaase/database.dart';
import 'package:quizzler/sharedPrefs.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:google_fonts/google_fonts.dart';

QuizBrain quizBrain = QuizBrain();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xff392850),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Wrapper(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final int n;
  QuizPage({this.n});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int count = 0;
  Users user;
  String myName;

  getUserInfo() async {
    myName = await HelperFunction.getUserMail();
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  void checkAns(bool ans) {
    setState(() {
      if (quizBrain.isFinished(widget.n) == true) {
        if (quizBrain.getCorrectAnswer(widget.n) == ans) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        count = scoreKeeper
            .where((element) => element.color == Colors.green)
            .length;
        String k;
        if (widget.n == 1) {
          k = "GK";
        } else if (widget.n == 2) {
          k = "CS";
        } else if (widget.n == 3) {
          k = "MAT";
        } else if (widget.n == 4) {
          k = "ENG";
        }

        DatabaseService().updateUserData(count, k, myName);
        DatabaseService().updateUsertot(count, k, myName);
        print(myName);
        reset();
      } else {
        if (quizBrain.getCorrectAnswer(widget.n) == ans) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion(widget.n);
      }
    });
  }

  void reset() async {
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {
      Alert(
        type: AlertType.success,
        context: context,
        title: 'Finished!',
        desc: '$count/${scoreKeeper.length}',
        buttons: [
          DialogButton(
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();

      quizBrain.reset();
      count = 0;
      scoreKeeper = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(quizBrain.getQuestionText(widget.n),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 19,
                            fontWeight: FontWeight.w600))),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The picked true.
                  checkAns(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAns(false);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
