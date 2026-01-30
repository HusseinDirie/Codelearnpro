import 'dart:convert';
import 'package:http/http.dart' as http;

class CodeExecutionService {
  static const String _baseUrl = 'https://piston.engineer/api/v2/execute';

  static Future<Map<String, dynamic>> executeCode({
    required String language,
    required String sourceCode,
  }) async {
    // Map our app's language names to Piston's language names
    String version = 'latest';
    String pistonLanguage = language.toLowerCase();

    if (pistonLanguage == 'javascript') {
      pistonLanguage = 'javascript';
      version = '18.15.0';
    } else if (pistonLanguage == 'python') {
      pistonLanguage = 'python';
      version = '3.10.0';
    } else if (pistonLanguage == 'dart' || pistonLanguage == 'flutter') {
      pistonLanguage = 'dart';
      version = '2.19.6';
    }

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'language': pistonLanguage,
          'version': version,
          'files': [
            {'content': sourceCode},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'output': data['run']['output'] ?? '',
          'error': data['run']['stderr'] ?? '',
          'success': true,
        };
      } else {
        return {
          'output': '',
          'error': 'Error: ${response.statusCode}\n${response.body}',
          'success': false,
        };
      }
    } catch (e) {
      return {'output': '', 'error': 'Connection Error: $e', 'success': false};
    }
  }
}
