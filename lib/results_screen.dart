
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/data/questions.dart';
import 'package:quize_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary=[];
    for(var i=0; i<chosenAnswer.length; i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer': chosenAnswer[i]

      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['correct_answer']==data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text('You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly'),
            const SizedBox(height: 30,),

           QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed:(){}, child: const Text('Restart quiz'),)
          ],
        ),
      ),
    );
  }

}