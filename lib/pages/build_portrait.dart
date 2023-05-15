import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler_app/logic/quiz_brain.dart';
import '../custom_widgets/custom_button.dart';

class BuildPortrait extends StatefulWidget {
  const BuildPortrait({super.key});

  @override
  State<BuildPortrait> createState() => _BuildPortraitState();
}

class _BuildPortraitState extends State<BuildPortrait> {
  final trueIcon = const Icon(Icons.check, color: Color(0xff92BA92));
  final falseIcon = const Icon(
    Icons.close,
    color: Color(0xffE97777),
  );

  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    bool correctAnswer = quizBrain.getAnswer();

    void trueButtonCheck() {
      if (quizBrain.getCurrentIndex() >= 9) {
      } else {
        scoreKeeper.add(trueIcon);
        if (correctAnswer) {
          debugPrint('You got it right!');
        } else {
          debugPrint('You got it wrong!');
        }
      }
    }

    void falseButtonCheck() {
      if (quizBrain.getCurrentIndex() >= 9) {
      } else {
        scoreKeeper.add(falseIcon);
        if (!correctAnswer) {
          debugPrint('You got it right!');
        } else {
          debugPrint('You got it wrong!');
        }
      }
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
              flex: 4,
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    quizBrain.getQuestion(),
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
                        quizBrain.nextQuestion();
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
                        quizBrain.nextQuestion();
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scoreKeeper,
            ),
          ],
        ),
      )),
    );
  }
}
