import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/AnswerButton.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/QuizQuestion.dart';

class questionhandler extends StatefulWidget {
  questionhandler({super.key, required this.onselectanswer});

  final void Function(String answer) onselectanswer;

  State<questionhandler> createState() {
    return _questionhandler();
  }
}

class _questionhandler extends State<questionhandler> {
  var CurrentQuestionIndex = 0;
  void AnswerQuestion(String selectedAnswers) {

    widget.onselectanswer(selectedAnswers);

    setState(() {
      CurrentQuestionIndex++;
    });
  }

  Widget build(context) {
    final questionno = questions[CurrentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionno.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ...questionno.ShuffledWidgets().map((answers) {
              return AnswerButton(
                answertext: answers,
                onTap: (){
                  AnswerQuestion(answers);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
