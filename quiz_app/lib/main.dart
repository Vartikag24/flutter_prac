import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';
import 'QnA.dart';

Quiz quiz = Quiz();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Away"),
          backgroundColor: Colors.yellow[200],
        ),
        backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyApp(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> score = [];
  var totscore = 0;
  void check(bool ans) {
    bool correctAns = quiz.getAnswer();
    setState(() {
      if (correctAns == ans) {
        score.add(Icon(
          Icons.check, 
          color: Colors.lightGreen,
        )
        );
        totscore += 1;
      } else {
        score.add(Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
        );
      }
      if (quiz.isFinished() == true) {
        Alert(
          context: context,
          title: 'Done, quiz completed!',
          desc:
              'You\'ve reached the end of the quiz and your score is ${totscore}',
        ).show();
        quiz.reset();
        score = [];
        totscore = 0;
      } else {
        quiz.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quiz.getQuestion(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "True",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  check(true);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "False",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  check(false);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: score,
          ),
        ]);
  }
}