import 'package:flutter/material.dart';

class startscreen extends StatelessWidget {
  startscreen( this.Quizstarter,{super.key});

  final void Function() Quizstarter;
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Learn flutter the fun Way!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right),
            onPressed: Quizstarter,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
