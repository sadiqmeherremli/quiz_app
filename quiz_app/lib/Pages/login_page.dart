import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/Provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF175754), // Arka plan rengini kırmızı olarak ayarla
      body: Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Stack(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "QUIZ",
                            style: TextStyle(
                              color: Color(0xFF004643),
                              fontSize: 44,
                              fontWeight:
                                  FontWeight.bold, // Yazi fontunu bold yap
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom:
                            20, // Khelo yazısını container'ın altına yerleştir
                        right:
                            0, // Khelo yazısını container'ın sağ tarafına yerleştir
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 0,
                              bottom:
                                  10), // Sağ ve alt kenarlardan içeri doğru padding ekle
                          child: const Text(
                            "Khelo",
                            style: TextStyle(
                              color: Color(0xFFF9CD74),
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold, // Yazi fontunu bold yap
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter Your Name",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                TextField(
                  controller: provider.textController,
                  decoration: InputDecoration(
                    labelText: 'Sadiq Meherremli...',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 202, 201, 201)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                const SizedBox(height: 168),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Color(0xFFF8C660),fixedSize: Size(382, 59)),
                  onPressed: () {
                    provider.userName = provider.textController.text;
                    if (provider.userName != null) {
                      provider.checkUserName(provider.userName!, context);
                    }
                  },
                  child: const Center(
                      child:
                          Text('Start', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
