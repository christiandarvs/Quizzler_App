import 'package:flutter/material.dart';
import 'package:quizzler_app/pages/build_landscape.dart';
import 'package:quizzler_app/pages/build_portrait.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const BuildPortrait();
        } else {
          return const BuildLandscape();
        }
      },
    );
  }
}
