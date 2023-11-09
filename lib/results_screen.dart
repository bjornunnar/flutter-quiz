import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen(this.selectedAnswers, {super.key});
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++){
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((data){
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly."),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){}, child: const Text("Restart Quiz")),
          ],
        ),
      )
    );
  }
}