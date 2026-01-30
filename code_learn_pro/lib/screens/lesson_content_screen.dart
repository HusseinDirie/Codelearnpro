import 'package:code_learn_pro/models/programming_language.dart';
import 'package:code_learn_pro/screens/ide_screen.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LessonContentScreen extends StatelessWidget {
  final Lesson lesson;
  final String languageName;

  const LessonContentScreen({
    super.key,
    required this.lesson,
    required this.languageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 28,
                color: AppTheme.vibrantYellow,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              lesson.content,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
            const SizedBox(height: 32),
            Text(
              'Tusaale: ${lesson.exampleTitle}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.vibrantYellow,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(128),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.vibrantYellow.withAlpha(51)),
              ),
              child: Text(
                lesson.exampleCode,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: AppTheme.vibrantYellow,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IDEScreen(
                        initialCode: lesson.exampleCode,
                        initialLanguage: languageName,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.code, color: AppTheme.vibrantYellow),
                label: const Text(
                  'Try in Playground (Tijaabi)',
                  style: TextStyle(color: AppTheme.vibrantYellow),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Dhammee (Done)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.vibrantYellow,
                  foregroundColor: AppTheme.darkTeal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
