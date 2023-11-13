import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen(this.selectedAnswers, this.startOver, {super.key});
  final List<String> selectedAnswers;
  final void Function() startOver;

// "getter" for summary data. mashes together the questions and the chosen answers
// and makes a list of maps that contain values for 1 question each.
// "getters" are basically functions but now we can skip the step where we
// feed the function into a variable, to be called later. we just call the getter.
  get summaryData {
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
    final numberOfTotalQuestions = questions.length;

    // the .where method makes a new list by going through summaryData and checking "where" the set conditions are met.
    // in this case, where the user answer and correct answer line up
    final numberOfCorrectAnswers = summaryData.where((data){ 
      return data["user_answer"] == data["correct_answer"]; // this either results in true or false
    }).length; // and then we just get the length of that list, which is the number we need.

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!",
            style: const TextStyle(
                color: Color.fromARGB(255, 238, 206, 247),
                fontFamily: "Lato",
                fontWeight: FontWeight.w200,
                fontSize: 22),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
              icon: const Icon(Icons.redo),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: (){startOver();}, 
              label: const Text("Restart Quiz")),
          ],
        ),
      )
    );
  }
}

// OutlinedButton.icon(
//             icon: const Icon(Icons.arrow_forward),
//             style: OutlinedButton.styleFrom(
//               foregroundColor: Colors.white,
//             ),
//             onPressed: startQuiz, 
//             label: const Text(
//               "Start Quiz",
//               )
//           ),