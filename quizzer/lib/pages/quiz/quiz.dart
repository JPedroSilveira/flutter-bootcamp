import 'package:flutter/material.dart';
import 'package:quizzer/pages/quiz/score_board.dart';
import 'package:quizzer/pages/quiz/end.dart';
import 'package:quizzer/pages/quiz/loading.dart';
import 'package:quizzer/pages/quiz/question/question.dart';
import 'package:quizzer/services/quiz.dart';
import 'package:quizzer/types/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizBrain _quizBrain = QuizBrain();
  final QuizService _quizService = QuizService();
  bool _isLoading = true;

  _QuizPageState() {
    loadQuestions();
  }

  void loadQuestions() async {
    await _quizService.loadQuiz(_quizBrain);

    setState(() {
      _isLoading = false;
    });
  }

  void _handleAnswer(bool answer) {
    setState(() {
      _quizBrain.nextQuestion(answer);
    });
  }

  void _handleReset() {
    setState(() {
      _quizBrain.reset();
    });
  }

  Widget _renderQuiz() {
    if (_isLoading) {
      return QuizLoading();
    }

    if (_quizBrain.hasQuestion()) {
      return QuizQuestion(
        question: _quizBrain.getQuestionText(),
        onNo: () => _handleAnswer(false),
        onYes: () => _handleAnswer(true),
      );
    } else {
      return QuizEnd(
        onReset: _handleReset,
      );
    }
  }

  Widget _renderScoreBoard() {
    return QuizScoreBoard(
      results: _quizBrain.results,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _renderQuiz(),
                _renderScoreBoard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
