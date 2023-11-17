import 'package:flutter/material.dart';
import 'package:quize_app/data/questions.dart';
import 'package:quize_app/questions_screen.dart';
import 'package:quize_app/results_screen.dart';
import 'package:quize_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
   List<String> selectedAnswers=[];
   var activeScreen="start_screen";
  // @override
  // void initState() {
  //   super.initState();
  // activeScreen='questions_screen';
  // }
  void switchScreen(){
    setState(() {
      activeScreen= 'questions_screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      // print("select: "+selectedAnswers.length.toString()+ "select: " + questions.length.toString());
      setState(() {
        activeScreen='result_screen';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget= StartScreen(switchScreen);
    if( activeScreen=='questions_screen'){
      screenWidget= QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen=='result_screen'){
      screenWidget= ResultsScreen(chosenAnswer: selectedAnswers,);
    }

   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       body: Container(
         decoration: const BoxDecoration(
           gradient: LinearGradient(colors: [
             Color.fromARGB(255, 78, 13, 151),
             Color.fromARGB(255, 107, 16, 168)
           ], begin: Alignment.topLeft, end: Alignment.bottomRight),
         ),
         child: screenWidget,
       ),
     ),
   );
  }

}
