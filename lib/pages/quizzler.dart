import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/logic/quiz_brain.dart';
import '../custom_widgets/custom_button.dart';

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => QuizzlerState();
}

class QuizzlerState extends State<Quizzler> {
  final trueIcon = const Icon(Icons.check, color: Color(0xff92BA92));
  final falseIcon = const Icon(
    Icons.close,
    color: Color(0xffE97777),
  );
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(trueIcon);
        quizBrain.userIsCorrect();
        debugPrint('${quizBrain.getScore()}');
      } else {
        scoreKeeper.add(falseIcon);
      }
      if (quizBrain.getCurrentIndex() >= 9) {
        displayScore();
      }
      quizBrain.nextQuestion();
    });
  }

  void displayScore() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${quizBrain.getScore()} / 10',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              )
            ],
          ),
          content: RichText(
            text: TextSpan(children: [
              const TextSpan(
                  text: 'Congratulations! Your score is: ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: '${quizBrain.getScore()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))
            ]),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  quizBrain.restartQuiz();
                  setState(() {
                    scoreKeeper.clear();
                  });
                },
                child: const Text('Try Again')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  SystemNavigator.pop();
                },
                child: const Text('Exit'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizzler',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(5),
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    label: 'true',
                    color: const Color(0xff92BA92),
                    voidCallback: () {
                      checkAnswer(true);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    label: 'false',
                    color: const Color(0xffE97777),
                    voidCallback: () {
                      checkAnswer(false);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
