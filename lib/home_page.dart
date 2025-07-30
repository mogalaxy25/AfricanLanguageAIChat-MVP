
import 'package:flutter/material.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  final List<String> languages = ['Hausa', 'Yoruba', 'Igbo', 'Mandingo', 'Swahili', 'English'];
  final List<String> models = ['ChatGPT', 'Claude', 'Gemini'];

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = languages.first;
    String selectedModel = models.first;

    return Scaffold(
      appBar: AppBar(title: Text("Choose Language & AI")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((lang) => DropdownMenuItem(value: lang, child: Text(lang))).toList(),
              onChanged: (val) {},
              decoration: InputDecoration(labelText: "Select Language"),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: models.map((model) => ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ChatPage(language: selectedLanguage, model: model)
                  ));
                },
                child: Text(model),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
