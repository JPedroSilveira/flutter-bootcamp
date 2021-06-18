import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quizzer/types/question.dart';
import 'package:quizzer/types/quiz_brain.dart';

class QuizService {
  static final QuizService _quizService = QuizService._internal();

  factory QuizService() {
    return _quizService;
  }

  QuizService._internal();

  Future<void> loadQuiz(QuizBrain quizBrain) async {
    final String response =
        await rootBundle.loadString('assets/data/questions.json');
    final data = await json.decode(response);
    final items = data['items'] as List;

    quizBrain.questions = items
        .map(
          (e) => Question.fromJson(e),
        )
        .toList();
  }
}
