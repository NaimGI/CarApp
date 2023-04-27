import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../../components/MyClipper.dart';
import '../../../style/colors.dart';

class Score extends StatefulWidget {
  final int score;
  const Score(this.score);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: AppColors.kclipath)),
                  child: const Center(
                      child: Text(
                    "النتيجة",
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  )))),
          if (9 - widget.score > widget.score)
            const Image(image: AssetImage("assets/Sad.png"), height: 170),
          if (9 - widget.score < widget.score)
            const Image(
                image: AssetImage("assets/emoji-happy.jpg"), height: 170),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(4),
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -4,
                              left: 40, // adjust the position of the icon up
                              child: Icon(Icons.question_answer_sharp,
                                  color: AppColors.kiconColor),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('33',
                                  style: TextStyle(
                                      color: AppColors.kiconColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(4),
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              top: -4,
                              left: 40, // adjust the position of the icon up
                              child: Icon(Icons.edit_document,
                                  color: AppColors.kiconColor),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${widget.score}',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(4),
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -4,
                              left: 40, // adjust the position of the icon up
                              child: const Icon(
                                CupertinoIcons.xmark,
                                color: AppColors.kiconColor,
                                size: 28,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('${33 - widget.score}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
