import 'package:code_learn_pro/models/programming_language.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<Quiz> quizzes;
  final String languageName;

  const QuizScreen({
    super.key,
    required this.quizzes,
    required this.languageName,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOption;
  bool _isAnswered = false;
  int _score = 0;

  void _submitAnswer() {
    if (_selectedOption == null) return;

    setState(() {
      _isAnswered = true;
      if (_selectedOption == widget.quizzes[_currentIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.quizzes.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _isAnswered = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.darkTeal,
        title: const Text('Quiz Result (Natiijada)'),
        content: Text(
          'Waxaad heshay $_score oo ka mid ah ${widget.quizzes.length}!',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back from quiz
            },
            child: const Text(
              'XIDH (Close)',
              style: TextStyle(color: AppTheme.vibrantYellow),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quizzes[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz: ${widget.languageName}')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / widget.quizzes.length,
              backgroundColor: AppTheme.accentTeal,
              valueColor: const AlwaysStoppedAnimation(AppTheme.vibrantYellow),
            ),
            const SizedBox(height: 32),
            Text(
              'Question (Su\'aal) ${_currentIndex + 1}:',
              style: const TextStyle(
                color: AppTheme.vibrantYellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              quiz.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            ...List.generate(quiz.options.length, (index) {
              final isCorrect = index == quiz.correctAnswerIndex;
              final isSelected = index == _selectedOption;

              Color borderColor = Colors.white24;
              if (_isAnswered) {
                if (isCorrect)
                  borderColor = Colors.green;
                else if (isSelected)
                  borderColor = Colors.red;
              } else if (isSelected) {
                borderColor = AppTheme.vibrantYellow;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: _isAnswered
                      ? null
                      : () {
                          setState(() {
                            _selectedOption = index;
                          });
                        },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? AppTheme.accentTeal : null,
                    ),
                    child: Row(
                      children: [
                        Text(
                          String.fromCharCode(64 + index + 1),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: Text(quiz.options[index])),
                        if (_isAnswered && isCorrect)
                          const Icon(Icons.check_circle, color: Colors.green),
                        if (_isAnswered && isSelected && !isCorrect)
                          const Icon(Icons.error, color: Colors.red),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _selectedOption == null
                    ? null
                    : (_isAnswered ? _nextQuestion : _submitAnswer),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.vibrantYellow,
                  foregroundColor: AppTheme.darkTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isAnswered
                      ? (_currentIndex < widget.quizzes.length - 1
                            ? 'Next (Su\'aasha Xigta)'
                            : 'Result (Arag Natiijada)')
                      : 'Check Answer (Hubi Jawaabta)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
