import 'package:flutter/material.dart';
import '../constants/language.dart';

class LanguageSelector extends StatelessWidget {
  final Map<String, String> initialLanguage;
  final Function(Map<String, String>) onLanguageChange;

  LanguageSelector({
    required this.initialLanguage,
    required this.onLanguageChange,
  });

  final List<Map<String, dynamic>> languages = [
    {'label': englishButton, 'language': langEnglish},
    {'label': hindiButton, 'language': langHindi},
    {'label': teluguButton, 'language': langTelugu},
    {'label': kannadaButton, 'language': langKannada},
    {'label': marathiButton, 'language': langMarathi},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/langstrip.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: languages.map((language) {
          final String label = language['label'];
          final Map<String, String> langMap = language['language'];
          return TextButton(
            child: Text(label),
            onPressed: () {
              onLanguageChange(langMap);
            },
          );
        }).toList(),
      ),
    );
  }
}
