import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Pages/login_page.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:quiz_app/Provider/login_provider.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => LoginProvider(),), ChangeNotifierProvider(
      create: (context) => QuizProvider() ,
    )],
    
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF673AB7)),
        useMaterial3: true,
      ),
      home: const QuizPage() 
    );
  }
}

