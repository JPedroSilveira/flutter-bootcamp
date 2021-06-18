class Question {
  final String question;
  final bool answer;

  Question({required this.question, required this.answer});

  factory Question.fromJson(dynamic json) {
    return Question(
      question: json['question'] as String,
      answer: json['answer'] as bool,
    );
  }
}
