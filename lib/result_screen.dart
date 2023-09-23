import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionssummary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.onRestart,{
    super.key,
    required this.choosenAnswers,
  });
  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getsummarydata() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'questions': questions[i].text,
        'correctanswer': questions[i].answer[0],
        'useranswer': choosenAnswers[i],
      });
      
    }
    return summary;
  }

  Widget build(context) {
    final SummaryData = getsummarydata();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = SummaryData.where((data) {
      return data['useranswer'] == data['correctanswer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions Correctly!",textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            Questionssummary(SummaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              icon: const Icon(Icons.refresh,color: Colors.white,),
              onPressed: onRestart,
              label: const Text("Restart  Quiz!",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
