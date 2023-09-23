import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/startscreen.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/result_screen.dart';

class quizhandler extends StatefulWidget
{
  quizhandler({super.key});
  @override
  State<quizhandler> createState()
  {
    return _quizhandler();
  }
}

class _quizhandler extends State<quizhandler>
{
  List<String> selectedAnswers=[];
  var activescreen='start-screen';

  
  void switchscreen()
  {
    setState(() {
      activescreen='question-screen';
    });
  }

  void chooseAnswer(String answers)
  {
    selectedAnswers.add(answers);

    if(selectedAnswers.length == questions.length)
    {
      setState(() {
        activescreen='result-screen';  
      });
    }
  }
  void onrestart()
  {
    setState(() {
      selectedAnswers=[];
      activescreen='question-screen';
    });
    
  }

  Widget build(context)
  {
    Widget screenwidget=startscreen(switchscreen);
    if(activescreen=='question-screen')
    {
      screenwidget=questionhandler(onselectanswer: chooseAnswer,);
    }

     if(activescreen=='result-screen')
    {
      screenwidget=ResultScreen(choosenAnswers: selectedAnswers,onrestart);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan, Colors.red, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child:screenwidget ,
        ),
      ),
    );
  }
}