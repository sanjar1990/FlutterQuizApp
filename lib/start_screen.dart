import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  void startScreen(){

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //   'assets/images/quiz-logo.png',
        //   width: 300,
        // ),),
        const SizedBox(
          height: 80,
        ),
         Text(
          "Learn flutter the fun way!",
          style: GoogleFonts.aBeeZee(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 60,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 22),
          backgroundColor: Colors.amber
          ),

          label: const Text('Start Quiz!'),
          icon: const Icon(Icons.arrow_right_alt),
        )
      ]),
    );
  }
}
