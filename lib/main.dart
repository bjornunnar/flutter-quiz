import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[800],
        body: const StartScreen()
      )
    )
  );
}

// STARTSCREEN CLASS
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          const Image(image: AssetImage("assets/images/quiz-logo.png"), width: 300,),
          // text
          Container(height: 80),
          const Text(
            "Learn Flutter the Fun Way!",
            style: TextStyle(color: Color.fromRGBO(255, 243, 243, 1), fontSize: 20)
          ),
          // button as new widget
          Container(height: 50),
          const StartButton(),
        ],
      ),
    );
  }
}


// START BUTTON CLASS
class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState(){ 
  return _StartButtonState();

  }
}

class _StartButtonState extends State<StartButton> {

  bool hasTheQuizStarted = false;

  // FUNCTION CALLED WHEN BUTTON IS PRESSED
  void startQuiz(){
    setState(() {
      // do something
      hasTheQuizStarted = true;
    });
  }

  @override
  Widget build(context){
    return OutlinedButton(
      onPressed: startQuiz, 
      child: const Text(
        "Start Quiz",
        style: TextStyle(color: Colors.white),
        )
    );
  }
}
