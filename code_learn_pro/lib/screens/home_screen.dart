import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_learn_pro/data/data_repository.dart';
import 'package:code_learn_pro/models/programming_language.dart';
import 'package:code_learn_pro/screens/detail_screen.dart';
import 'package:code_learn_pro/screens/ide_screen.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baro Programming-ka'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IDEScreen()),
              );
            },
            icon: const Icon(Icons.terminal, color: AppTheme.vibrantYellow),
            tooltip: 'Open Code Playground',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: DataRepository.languages.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final language = DataRepository.languages[index];
          return LanguageCard(language: language);
        },
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final ProgrammingLanguage language;

  const LanguageCard({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(language: language),
          ),
        );
      },
      child: Container(
        height: 120, // Fixed height for consistency
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.vibrantYellow.withAlpha(51), // 0.2 * 255
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51), // 0.2 * 255
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section with decorative clipping
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: SizedBox(
                width: 100,
                height: double.infinity,
                child: Hero(
                  tag: 'img_${language.name}',
                  child: CachedNetworkImage(
                    imageUrl: language.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppTheme.darkTeal,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            // Content Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Hero(
                          tag: 'icon_${language.name}',
                          child: Icon(
                            language.icon,
                            color: AppTheme.vibrantYellow,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      language.tagline,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.softWhite.withAlpha(178), // 0.7 * 255
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '${language.popularityScore}% Caannimada',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppTheme.softWhite.withAlpha(
                                  128,
                                ), // 0.5 * 255
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Arrow
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.vibrantYellow.withAlpha(128), // 0.5 * 255
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
