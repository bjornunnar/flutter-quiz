import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  

  @override
  Widget build(context){
    Color indexBackground;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            if ((data["user_answer"]) == (data["correct_answer"])) {
              indexBackground = const Color.fromARGB(255, 133, 214, 136);
              } else { 
              indexBackground = const Color.fromARGB(255, 214, 118, 112);
              }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
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
                        Text(data["question"] as String,
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
          }).toList(),
          ),
      ),
    );
  }
}

