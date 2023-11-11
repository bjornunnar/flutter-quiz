import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // initialize the list of the user's answers, we will be .adding to this list when they pick an answer
  String activeScreen = "start-screen";

  // initState is a built in function that runs one time, after the class is built.
  // this is an example
  // -- instead, we are using the screenWidget variable within the build method, with an if statement
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // we include this in the results screen, it's used to start over again, resetting the user answers list
  void startOver(){
    selectedAnswers = [];
    setState(() {
      activeScreen = "start-screen";
    });
  }

  // this is called each time the user picks an answer. we check if there is a next question, if not we move to the results screen
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  // to move from the start screen to the questions screen
  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {

    // we define which custom widget we want the base MaterialApp to build, based on where the user is in the process
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(selectedAnswers, startOver);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient( // this is the gradient background color we use for the entire app
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
