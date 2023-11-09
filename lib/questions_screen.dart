import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){ 
  return _QuestionsScreenState();

  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];



    return SizedBox(
      width: double.infinity,
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
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answer, (){answerQuestion(answer);});
            })
              
          ],
        ),
      ),
    );
  }

}