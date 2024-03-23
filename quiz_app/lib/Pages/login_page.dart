import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/quiz_page.dart';

class AppView extends StatelessWidget {
  AppView({super.key});

  final TextEditingController textController = TextEditingController();

  void checkUserName(String userName, BuildContext context) {
    if (userName.trim().isNotEmpty) { // false
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizPage(),
      ));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Field is Not Empty"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: Colors.black),
            ),
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.only(right: 260),
              child: Text("Enter Your Name"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Sadiq Meherremli...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(height: 168),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(383, 59),
                  backgroundColor: Colors.amber),
              onPressed: () {
                checkUserName(textController.text, context);
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
