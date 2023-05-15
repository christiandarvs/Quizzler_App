import 'question.dart';

class QuizBrain {
  final int _score = 0;
  int _currentIndex = 0;
  final List<Question> _questions = [
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
  String getQuestion() {
    return _questions[_currentIndex].question;
  }

  bool getAnswer() {
    return _questions[_currentIndex].answer;
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    }
  }

  int getCurrentIndex() {
    return _currentIndex;
  }

  int getQuizQuestionsLength() {
    return _questions.length - 1;
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
