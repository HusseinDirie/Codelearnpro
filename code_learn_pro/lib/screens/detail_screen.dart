import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_learn_pro/models/programming_language.dart';
import 'package:code_learn_pro/screens/lesson_list_screen.dart';
import 'package:code_learn_pro/screens/quiz_screen.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ProgrammingLanguage language;

  const DetailScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppTheme.darkTeal,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                language.name,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black.withAlpha(128), // 0.5 * 255
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: Hero(
                tag: 'img_${language.name}',
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withAlpha(51), // 0.2 * 255
                        AppTheme.darkTeal.withAlpha(204), // 0.8 * 255
                      ],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.darken,
                  child: CachedNetworkImage(
                    imageUrl: language.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: 'icon_${language.name}',
                      child: Icon(
                        language.icon,
                        size: 64,
                        color: AppTheme.vibrantYellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Overview (Guud-mar)',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppTheme.vibrantYellow,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    language.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Key Features',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppTheme.vibrantYellow,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ...language.keyFeatures.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.vibrantYellow,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 12,
                              color: AppTheme.darkTeal,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LessonListScreen(language: language),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.vibrantYellow,
                        foregroundColor: AppTheme.darkTeal,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Barashada Bilow (Start Learning)'),
                    ),
                  ),
                  if (language.quizzes.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                quizzes: language.quizzes,
                                languageName: language.name,
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.vibrantYellow,
                          side: const BorderSide(
                            color: AppTheme.vibrantYellow,
                            width: 2,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Quiz-ka Bilow (Start Quiz)'),
                      ),
                    ),
                  ],
                  const SizedBox(height: 50), // Bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
