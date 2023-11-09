import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;
  
  @override
  Widget build(context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(              
                backgroundColor: const Color.fromARGB(255, 33, 1, 95),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
              child: Text(
                answerText,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}