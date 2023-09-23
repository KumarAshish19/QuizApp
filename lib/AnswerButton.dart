import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
 const  AnswerButton({required this.answertext,required this.onTap,super.key});

  final String answertext;
  final void Function() onTap;

  Widget build(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(answertext,textAlign: TextAlign.center,)),
      ]);
  }
}
