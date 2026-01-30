import 'package:code_learn_pro/data/code_execution_service.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:flutter/material.dart';

class IDEScreen extends StatefulWidget {
  final String initialCode;
  final String initialLanguage;

  const IDEScreen({
    super.key,
    this.initialCode = '',
    this.initialLanguage = 'Python',
  });

  @override
  State<IDEScreen> createState() => _IDEScreenState();
}

class _IDEScreenState extends State<IDEScreen> {
  late TextEditingController _codeController;
  String _output = '';
  bool _isLoading = false;
  late String _selectedLanguage;

  final List<String> _languages = ['Python', 'JavaScript', 'Dart'];

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.initialCode);
    _selectedLanguage = widget.initialLanguage;
  }

  Future<void> _runCode() async {
    setState(() {
      _isLoading = true;
      _output = 'Socodeysa (Running)...';
    });

    final result = await CodeExecutionService.executeCode(
      language: _selectedLanguage,
      sourceCode: _codeController.text,
    );

    setState(() {
      _isLoading = false;
      if (result['success']) {
        _output = result['output'].isNotEmpty
            ? result['output']
            : (result['error'].isNotEmpty
                  ? result['error']
                  : 'Code-ka wuu shaqeeyey laakiin ma jiro output.');
      } else {
        _output = 'Error: ${result['error']}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground', style: TextStyle(fontSize: 18)),
        centerTitle: false,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.accentTeal.withAlpha(128),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: _selectedLanguage,
              underline: Container(),
              dropdownColor: AppTheme.darkTeal,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.vibrantYellow,
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                }
              },
              items: _languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: AppTheme.vibrantYellow,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(128),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.vibrantYellow.withAlpha(51)),
              ),
              child: TextField(
                controller: _codeController,
                maxLines: null,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.white,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ku qor code-ka halkan...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.terminal,
                  size: 16,
                  color: AppTheme.vibrantYellow,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Output',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.vibrantYellow,
                  ),
                ),
                const Spacer(),
                if (_output.isNotEmpty)
                  IconButton(
                    onPressed: () => setState(() => _output = ''),
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.white54,
                    ),
                    tooltip: 'Clear Console',
                  ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _runCode,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.darkTeal,
                          ),
                        )
                      : const Icon(Icons.play_arrow, size: 18),
                  label: const Text('Run'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.vibrantYellow,
                    foregroundColor: AppTheme.darkTeal,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.accentTeal.withAlpha(128),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.greenAccent,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
