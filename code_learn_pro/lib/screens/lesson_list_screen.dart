import 'package:code_learn_pro/models/programming_language.dart';
import 'package:code_learn_pro/screens/lesson_content_screen.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LessonListScreen extends StatelessWidget {
  final ProgrammingLanguage language;

  const LessonListScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lessons (${language.name})')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: language.lessons.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final lesson = language.lessons[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.vibrantYellow,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: AppTheme.darkTeal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                lesson.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(fontSize: 18),
              ),
              subtitle: Text(
                'Baro wax ku saabsan ${lesson.title}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.play_circle_outline,
                color: AppTheme.vibrantYellow,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonContentScreen(
                      lesson: lesson,
                      languageName: language.name,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
