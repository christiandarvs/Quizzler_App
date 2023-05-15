import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../logic/question.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildLandscape extends StatefulWidget {
  const BuildLandscape({super.key});

  @override
  State<BuildLandscape> createState() => _BuildLandscapeState();
}

class _BuildLandscapeState extends State<BuildLandscape> {
  final trueButton = const Icon(Icons.check, color: Color(0xff92BA92));
  final falseButton = const Icon(
    Icons.close,
    color: Color(0xffE97777),
  );
  int currentIndex = 0;
  int score = 0;
  List<Icon> scoreKeeper = [];
  List<Question> questions = [
    Question(
        question:
            'Lightning is seen before it\'s heard because light travels faster than sound.',
        answer: true),
    Question(question: 'Melbourne is the capital of Australia.', answer: false),
    Question(question: 'Vatican City is a country.', answer: true),
    Question(question: 'Google was initially called BackRub.', answer: true),
    Question(question: 'Cleopatra was of Egyptian descent.', answer: false),
    Question(
        question: 'Being scared of clouds is called Coulrophobia.',
        answer: false),
    Question(question: 'All mammals live on land.', answer: false),
    Question(
        question: 'Depression is the leading cause of disability worldwide.',
        answer: true),
    Question(
        question: 'Light bulbs were the invention of Thomas Edison.',
        answer: false),
    Question(
        question: 'Mount Fuji is the highest mountain in Japan.', answer: true)
  ];

  @override
  Widget build(BuildContext context) {
    bool correctAnswer = questions[currentIndex].answer;
    void trueButtonCheck() {
      scoreKeeper.add(trueButton);
      if (correctAnswer) {
        score++;
        debugPrint('You got it right');
      } else {
        debugPrint('You got it wrong');
      }
      debugPrint('Score: $score');
    }

    void falseButtonCheck() {
      scoreKeeper.add(falseButton);
      if (!correctAnswer) {
        score++;
        debugPrint('You got it right');
      } else {
        debugPrint('You got it wrong');
      }
      debugPrint('Score: $score');
    }

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
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    questions[currentIndex].question,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    label: 'true',
                    color: const Color(0xff92BA92),
                    voidCallback: () {
                      trueButtonCheck();
                      setState(() {
                        currentIndex++;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    label: 'false',
                    color: const Color(0xffE97777),
                    voidCallback: () {
                      falseButtonCheck();
                      setState(() {
                        currentIndex++;
                      });
                    },
                  )
                ],
              ),
            ),
            Row(children: scoreKeeper),
          ],
        ),
      )),
    );
  }
}

/*
1: true
2: false
3: true
4: true
5: false
6: false
7: false
8: true
9: false
10: true
*/

