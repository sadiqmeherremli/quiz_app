import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/text_constants.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();

  String? userName;

  void _saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("loginName", textController.text);
  }

  void checkUserName(String userName, BuildContext context) {
    if (userName.trim().isNotEmpty) {
      _saveUserToDevice();
      // false
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const QuizPage(),
      ));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(TextConstants.erorMassage),
          );
        },
      );
    }
  }

  void _checkUserDevice( BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginName = prefs.getString("loginName");
    if (loginName != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const QuizPage()));
    }
  }
}
