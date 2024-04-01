import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/list_question.dart';
import 'package:quiz_app/Provider/quiz_provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBECEE),
        body: Consumer<QuizProvider>(
          builder: (context, provider, child) {
            return PageView.builder(
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
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
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
                              provider.selectAnswer(index);
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
                                provider.selectedIndex == index
                                    ? Icon(Icons.check_circle,
                                        color: Colors.green)
                                    : SizedBox()
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      ElevatedButton(
                        
                        onPressed: provider.selectedIndex == null ? null :  
                          () {
                           if (provider.currentIndex == questions.length - 1) {
                            provider.showLeaderboard(context);
                           } else {
                            provider.checkAnswer(pageIndex,controller);
                            print(controller.initialPage);
                           }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: (provider.currentIndex == questions.length - 1)
                            ? Text('Finish')
                            : Text("Next"),
                            
                      ),
                    ],
                  );
                });
          },
        ));
  }
}
