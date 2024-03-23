import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of Italy?',
      'answers': ['Paris', 'Rome', 'Berlin', 'London', 'Baku'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is 3 + 3?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the capital of Italy?',
      'answers': ['Paris', 'Rome', 'Berlin', 'London', 'Baku'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is 3 + 3?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the capital of Italy?',
      'answers': ['Paris', 'Rome', 'Berlin', 'London', 'Baku'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is 3 + 3?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the capital of Italy?',
      'answers': ['Paris', 'Rome', 'Berlin', 'London', 'Baku'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is 3 + 3?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': 1,
    },
  ];
  PageController controller = PageController();

  int questionIndex = 0;
  String? selectedAnswer;
  bool quizCompleted = false;
  int correctAnswersCount = 0;
  int? selectedIndex;
  int currentIndex = 0;

  void selectAnswer(int index) {
    selectedIndex = index;
    setState(() {});
  }

  void checkAnswer(int index) {
    index++;
    currentIndex++;
    controller.jumpToPage(index);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBECEE),
      body: Center(
        child: PageView.builder(
            controller: controller,
            itemCount: questions.length,
            itemBuilder: (context, pageIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    color: const Color(0xFFFFFFFF),
                    child: Center(
                      child: Text(
                        questions[pageIndex]["question"],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: questions[pageIndex]["answers"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: () {
                          selectAnswer(index);
                          print(index);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              questions[pageIndex]["answers"][index],
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            selectedIndex == index
                                ? IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(FontAwesomeIcons.circleCheck))
                                : SizedBox()
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      checkAnswer(pageIndex);
                      print(controller.initialPage);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: (currentIndex==questions.length-1) ? Text('Finish'): Text("Next"),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
