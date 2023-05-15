import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_button.dart';

class BuildPortrait extends StatefulWidget {
  const BuildPortrait({super.key});

  @override
  State<BuildPortrait> createState() => _BuildPortraitState();
}

class _BuildPortraitState extends State<BuildPortrait> {
  List<Icon> scoreKeeper = [];

  Icon addCheckIcon() {
    return const Icon(Icons.check, color: Color(0xff92BA92));
  }

  Icon addFalseIcon() {
    return const Icon(
      Icons.close,
      color: Color(0xffE97777),
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
              flex: 4,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                child: Text(
                  'This is where the question will go',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 18),
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
                      debugPrint('true');
                      setState(() {
                        scoreKeeper.add(addCheckIcon());
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
                      debugPrint('false');
                      setState(() {
                        scoreKeeper.add(addFalseIcon());
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
