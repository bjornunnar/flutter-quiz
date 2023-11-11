import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/models/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer; // we inherit the chooseAnswer function from quiz.dart

  @override
  State<QuestionsScreen> createState(){ 
  return _QuestionsScreenState();

  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // when an asnwer is chosen, we add it to the selectedAnswers list, check if there are any more questions.
  // if there aren't, the chooseAnswer function in quiz.dart moves us to the results screen.
  // if there are more questions, the currenQuestionIndex ticks up and we get the next one
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex]; // the currentQuestion is checked against the cQIndex at build



    return SizedBox(
      width: double.infinity, // double.infinity takes the available space dependent on the device being used
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 238, 206, 247),
                fontWeight: FontWeight.bold,
                fontSize: 24),
              ),
            const SizedBox(
              height: 30,
            ),
            // the "..." is shorthand that makes Flutter return each item in thist list individually, instead of the actual list as object
            // this code does the following:
            // 1. calls getShuffledAnswers on the currentQuestion object.
            // This copies the current question item, rearranges the questions (bc the 1st answer is always the correct one in the original Question), and returns them
            // 2. then calls the map method on that object, which returns an AnswerButton object for each question,
            // containing the 'answer' value, and including the answerQuestion function, whith the answer as a parameter.
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answer, (){answerQuestion(answer);});
            })
              
          ],
        ),
      ),
    );
  }

}