
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(AfricanLanguageAIChatApp());
}

class AfricanLanguageAIChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'African Language AI Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashPage(),
    );
  }
}
