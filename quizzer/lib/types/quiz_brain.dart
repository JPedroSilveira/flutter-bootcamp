import 'package:quizzer/types/question.dart';

class QuizBrain {
  List<Question> _questions = [];
  List<bool> results = [];
  int _questionNumber = 0;

  set questions(List<Question> q) {
    _questions = q;
    reset();
  }

  bool hasQuestion() =>
      _questions.isNotEmpty && _questionNumber < _questions.length;

  String getQuestionText() => _questions[_questionNumber].question;

  void nextQuestion(bool answer) {
    final isRight = _questions[_questionNumber].answer == answer;
    results.add(isRight);
    _questionNumber++;
  }

  void reset() {
    results = [];
    _questionNumber = 0;
  }
}
