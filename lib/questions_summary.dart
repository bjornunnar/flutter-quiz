import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData; // we inherit the list of questions and answers from the getter in quiz.dart
  

  @override
  Widget build(context){
    Color indexBackground;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView( // makes a "frame" within the full size screen, that prevents this content from reaching the bottom of the screen, but makes it scrollable.
        child: Column(
          // similar to the questions_screen, we take the questions+answers list and call the map method.
          // this returnsa Row for each item, and allows us to check the user's answers against what we know are the correct answers in the list (the first ones).

          children: summaryData.map((data){  // "children" requires a list of items. here we return a widget, and at the very end (see below) we tell the output to become a list!

            if ((data["user_answer"]) == (data["correct_answer"])) { // check if answer is correct, store the red/green background value to use below
              indexBackground = const Color.fromARGB(255, 133, 214, 136);
              } else { 
              indexBackground = const Color.fromARGB(255, 214, 118, 112);
              }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar( // a circular background for the question number
                  radius: 14,
                  backgroundColor: indexBackground,
                  child: Text(((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(color: Color.fromARGB(255, 41, 41, 41),fontWeight: FontWeight.bold),
                    ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["question"] as String, // because the summaryData is a list of "objects", we need to tell flutter what type the current element is, when using it!
                        style: const TextStyle(color: Colors.white, fontSize: 18),),
                        const SizedBox(height: 5),
                        Text(data["user_answer"] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 184, 245, 114),
                        fontSize: 14,)),
                        Text(data["correct_answer"] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 255, 143, 180)),),
                    ],
                    ),
                  ),
                ),
              )
            ]);
          }).toList(), // makes this whole thing into a list that can be given to "children"
          ),
      ),
    );
  }
}

