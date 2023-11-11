import 'package:flutter/material.dart';

// STARTSCREEN CLASS
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; // Function inherited from quiz.dart

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // image
          const Image(
            image: AssetImage(
              "assets/images/film-white.png"
              ), 
            width: 300, 
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          // text
          const SizedBox(height: 80), // empty SizedBox elements used for spacing between elements
          const Text(
            "The David Fincher Quiz",
            style: TextStyle(color: Color.fromRGBO(255, 243, 243, 1), fontSize: 24)
          ),
          // button as new widget
          const SizedBox(height: 50),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz, // and here we call the function to start
            label: const Text(
              "Start Quiz",
              )
          ),
        ],
      ),
    );
  }
}
