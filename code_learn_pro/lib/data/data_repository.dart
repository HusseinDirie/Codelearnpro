import 'package:code_learn_pro/models/programming_language.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataRepository {
  static const List<ProgrammingLanguage> languages = [
    ProgrammingLanguage(
      name: 'Python',
      tagline: 'Luuqadda AI iyo Data Science',
      description:
          'Python waa luuqad aad u awood badan oo loo isticmaalo AI (Artificial Intelligence), Data Science, iyo Web Development. Waxay caan ku tahay in Syntax-keedu uu aad u fudud yahay.',
      icon: FontAwesomeIcons.python,
      imageUrl:
          'https://images.unsplash.com/photo-1526379095098-d400fd0bf935?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      popularityScore: 98,
      keyFeatures: ['Simple Syntax', 'AI & ML Libraries', 'Scalable Backend'],
      lessons: [
        Lesson(
          title: 'Hordhaca Python (Fundamentals)',
          content:
              'Python waa interpreted language. Si aad wax ugu soo bandhigto shaashadda, waxaad isticmaalaysaa print() function.',
          exampleTitle: 'Printing in Python',
          exampleCode: 'print("Kuso dhowaw Python!")',
        ),
        Lesson(
          title: 'Variables iyo Data Types',
          content:
              'Variables waxaa loo isticmaalaa in lagu kaydiyo xogta (Data). Data types-ka ugu muhiimsan waa String, Integer, iyo Float.',
          exampleTitle: 'Variables Example',
          exampleCode: 'name = "Framework"\nage = 25\nprint(name)',
        ),
        Lesson(
          title: 'Control Flow: If/Else',
          content:
              'Conditional statements waxaa loo isticmaalaa in go\'aan lagu gaaro (Decision making) iyadoo la eegayo xaalada ka jirta code-ka.',
          exampleTitle: 'If/Else Example',
          exampleCode:
              'age = 20\nif age > 18:\n    print("Adult")\nelse:\n    print("Minor")',
        ),
        Lesson(
          title: 'Loops (For & While)',
          content:
              'Loops waxaa loo isticmaalaa in lagu celceliyo code-ka (Repetition) ilaa shuruud laga gaaro.',
          exampleTitle: 'For Loop Example',
          exampleCode: 'for i in range(5):\n    print("Number: ", i)',
        ),
        Lesson(
          title: 'Functions Basics',
          content:
              'Functions waa blocks of code oo dib loo isticmaali karo (Reusable code) si loo nidaamiyo barnaamijka.',
          exampleTitle: 'Function Definition',
          exampleCode:
              'def salaam(name):\n    print("Hello " + name)\n\nsalaam("Ali")',
        ),
      ],
      quizzes: [
        Quiz(
          question: 'Sidee looga qoraa "Hello" console-ka Python?',
          options: ['echo "Hello"', 'print("Hello")', 'console.log("Hello")'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Waa maxay calaamadda loo isticmaalo comments-ka Python?',
          options: ['//', '/*', '#'],
          correctAnswerIndex: 2,
        ),
        Quiz(
          question: 'Waa kuwee kuwan soo socda Data Type sax ah?',
          options: ['String', 'Text', 'Letter'],
          correctAnswerIndex: 0,
        ),
        Quiz(
          question: 'Sida loo qoro loop 5 jeer soo noqonaya?',
          options: ['for i in range(5):', 'repeat(5):', 'loop(5):'],
          correctAnswerIndex: 0,
        ),
        Quiz(
          question: 'Python ma yahay Case-Sensitive language?',
          options: ['Haa (Yes)', 'Maya (No)'],
          correctAnswerIndex: 0,
        ),
      ],
    ),
    ProgrammingLanguage(
      name: 'JavaScript',
      tagline: 'Luuqadda Web Development',
      description:
          'JavaScript waa backbone-ka Web-ka. Waxaa loo isticmaalaa Frontend iyo Backend labadaba si loo dhiso Websites casri ah.',
      icon: FontAwesomeIcons.js,
      imageUrl:
          'https://images.unsplash.com/photo-1627398242454-45a1465c2479?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      popularityScore: 97,
      keyFeatures: [
        'Interactive Web',
        'Asynchronous Support',
        'Huge Ecosystem',
      ],
      lessons: [
        Lesson(
          title: 'Hordhaca JavaScript',
          content:
              'JS wuxuu shaqeeyaa dhinaca Client-ka (Browser). Waxaa lagu qoraa inta badan gudaha HTML script tags si loo baro Logic-ga.',
          exampleTitle: 'Hello JavaScript',
          exampleCode: 'console.log("Hello JS!");',
        ),
        Lesson(
          title: 'Variables (let, const, var)',
          content:
              'JS wuxuu leeyahay dhowr qaab oo Variables loo declaration gareeyo. let iyo const ayaa ugu muhiimsan maanta.',
          exampleTitle: 'JS Variables',
          exampleCode:
              'const pi = 3.14;\nlet name = "Ali";\nconsole.log(name);',
        ),
        Lesson(
          title: 'Control Flow (If/Else)',
          content:
              'Si la mid ah Python iyo luuqadaha kale, JS wuxuu leeyahay if/else statement si go\'aano loo gaaro.',
          exampleTitle: 'If/Else JS',
          exampleCode:
              'let x = 10;\nif (x > 5) {\n  console.log("Weyntay");\n}',
        ),
        Lesson(
          title: 'Functions iyo Arrow Functions',
          content:
              'Functions waxaa loo qori karaa qaabka regular ama modern Arrow function oo ah qaab aad u gaaban.',
          exampleTitle: 'Arrow Function',
          exampleCode:
              'const greet = (name) => {\n  console.log("Hi " + name);\n};\n\ngreet("Ali");',
        ),
      ],
      quizzes: [
        Quiz(
          question: 'Sidee loogu daraa single-line comment gudaha JS?',
          options: ['# comment', '// comment', '<!-- comment -->'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Waa maxay output-ka 2 + "2" gudaha JS?',
          options: ['4', '"22"', 'Error'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question:
              'Midkee loo isticmaalaa constant variable oo aan isbadalin?',
          options: ['let', 'var', 'const'],
          correctAnswerIndex: 2,
        ),
        Quiz(
          question: 'Sidee loo bilaabaa For Loop sax ah?',
          options: [
            'for (i <= 5; i++)',
            'for (let i = 0; i < 5; i++)',
            'for i = 1 to 5',
          ],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'JavaScript ma yahay Single-threaded language?',
          options: ['Haa (Yes)', 'Maya (No)'],
          correctAnswerIndex: 0,
        ),
      ],
    ),
    ProgrammingLanguage(
      name: 'Flutter',
      tagline: 'Multi-platform UI Toolkit',
      description:
          'Flutter wuxuu kuu ogolaanayaa inaad hal codebase ku dhisto Apps loogu talagalay Mobile (Android/iOS), Web, iyo Desktop.',
      icon: FontAwesomeIcons.paperPlane,
      imageUrl:
          'https://images.unsplash.com/photo-1617042375876-a13e36732a04?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      popularityScore: 92,
      keyFeatures: ['Hot Reload', 'Rich Widgets', 'Native Performance'],
      lessons: [
        Lesson(
          title: 'Hordhaca Flutter & Dart',
          content:
              'Flutter wuxuu isticmaalaa Dart language. Wax kasta oo Flutter ku jira waa Widget (Everything is a Widget).',
          exampleTitle: 'Main function',
          exampleCode: 'void main() {\n  runApp(MyApp());\n}',
        ),
        Lesson(
          title: 'Stateless vs Stateful Widgets',
          content:
              'Stateless widget ma badalo state-kiisa. Stateful widget wuxuu u baahan yahay setState() si interface-ka u isbadalo.',
          exampleTitle: 'StatelessWidget',
          exampleCode:
              'class MyText extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) => Text("Hi");\n}',
        ),
        Lesson(
          title: 'Loops and Control Flow in Dart',
          content:
              'Dart (Flutter language) waxay leedahay Loops iyo Control Flow la mid ah JS iyo Java.',
          exampleTitle: 'Dart Loop',
          exampleCode:
              'for (var i = 0; i < 3; i++) {\n  print("Hello \${i}");\n}',
        ),
      ],
      quizzes: [
        Quiz(
          question: 'Luuqadda ay Flutter ku dhisan tahay waa maxay?',
          options: ['Java', 'Dart', 'Kotlin'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Waa maxay shaqada Hot Reload?',
          options: [
            'In App-ka la tirtiro',
            'In isbedelka code-ka isla markaana la arko',
            'In App-ka build gareeyo',
          ],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Midkee ah wax kasta oo Flutter ku jira?',
          options: ['Module', 'Widget', 'Plugin'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Waa maxay code-ka lagu bilaabo socodsiinta Flutter App?',
          options: ['startApp()', 'runApp()', 'init()'],
          correctAnswerIndex: 1,
        ),
        Quiz(
          question: 'Flutter ma wuxuu isticmaalaa Native Components-ka OS-ka?',
          options: ['Haa', 'Maya, isaga ayaa render gareesta layout-ka'],
          correctAnswerIndex: 1,
        ),
      ],
    ),
  ];
}
