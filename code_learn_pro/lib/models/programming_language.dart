import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String content;
  final String exampleTitle;
  final String exampleCode;

  const Lesson({
    required this.title,
    required this.content,
    required this.exampleTitle,
    required this.exampleCode,
  });
}

class Quiz {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const Quiz({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class ProgrammingLanguage {
  final String name;
  final String description;
  final IconData icon; // Keep it generic IconData to support FontAwesome
  final String imageUrl;
  final String tagline;
  final int popularityScore; // 0-100
  final List<String> keyFeatures;
  final List<Lesson> lessons;
  final List<Quiz> quizzes;

  const ProgrammingLanguage({
    required this.name,
    required this.description,
    required this.icon,
    required this.imageUrl,
    required this.tagline,
    required this.popularityScore,
    required this.keyFeatures,
    required this.lessons,
    required this.quizzes,
  });
}
