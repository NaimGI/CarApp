import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../Service/QuestionsService.dart';
import '../../../components/textStyle.dart';
import '../../../config/colors.dart';
import 'ScorePage.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  int points = 0;

  var isLoaded = false;

  var optionsList = [];
  var correctAnswer = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
    QuestionService ques = QuestionService();
    quiz = ques.getAllQuestions();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: kappcolors,
        )),
        child: FutureBuilder(
          future: quiz,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;

              if (isLoaded == false) {
                optionsList = data[currentQuestionIndex]["incorrect_answers"];
                correctAnswer = data[currentQuestionIndex]["correct_answer"];
                optionsList
                    .addAll(data[currentQuestionIndex]["correct_answer"]);
                optionsList.shuffle();
                isLoaded = true;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: lightgrey, width: 2),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.xmark,
                                color: Colors.white,
                                size: 28,
                              )),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            normalText(
                                color: Colors.white,
                                size: 24,
                                text: "$seconds"),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: seconds / 60,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: lightgrey, width: 2),
                          ),
                          child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(CupertinoIcons.heart_fill,
                                  color: Colors.white, size: 18),
                              label: normalText(
                                  color: Colors.white, size: 14, text: "Like")),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            data[currentQuestionIndex]["img"],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                            color: lightgrey,
                            size: 18,
                            text:
                                "Question ${currentQuestionIndex + 1} of ${data.length}")),
                    const SizedBox(height: 20),
                    normalText(
                        color: Colors.white,
                        size: 20,
                        text: data[currentQuestionIndex]["question"]),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var answer =
                            data[currentQuestionIndex]["correct_answer"];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (correctAnswer
                                  .contains(optionsList[index].toString())) {
                                optionsColor[index] = Colors.green;
                                points = points + 1;
                              } else {
                                optionsColor[index] = Colors.red;
                              }

                              if (currentQuestionIndex < data.length - 1) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  gotoNextQuestion();
                                });
                              } else {
                                timer!.cancel();
                                //here you can do whatever you want with the results
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Score(points)));
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: size.width - 100,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: optionsColor[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: headingText(
                              color: Colors.blue,
                              size: 18,
                              text: optionsList[index].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}
