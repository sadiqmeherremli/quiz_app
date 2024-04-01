import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/leader_board_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizProvider extends ChangeNotifier {
  int questionIndex = 0;
  String? selectedAnswer;
  bool quizCompleted = false;
  int correctAnswersCount = 0;
  int? selectedIndex;
  int currentIndex = 0;

  void selectAnswer(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void checkAnswer(int index, PageController controller) {
    index++;
    currentIndex++;
    controller.jumpToPage(index);
    selectedIndex = null;
    notifyListeners();
  }

  String? loginName;

  void _getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    loginName = prefs.getString("loginName");
  }

  void showLeaderboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaderboardPage(
          userName: loginName ?? 'Unknown',
          correctAnswersCount: correctAnswersCount,
        ),
      ),
    );
  }
}
