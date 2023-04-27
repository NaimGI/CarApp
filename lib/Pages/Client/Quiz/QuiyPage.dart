import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../components/textStyle.dart';
import '../../../config/colors.dart';
import 'QuizQuestion.dart';

class QuiyPage extends StatelessWidget {
  const QuiyPage({Key? key}) : super(key: key);
  static const routeName = "/quiz";

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Image.asset(
                "assets/mokta3a.png",
                height: 170,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey,
                  size: 18,
                  text: "مرحباً بكم في تطبيق الاختبار"),
              headingText(
                  color: Colors.white, size: 32, text: "تطبيق الاختبار"),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey,
                  size: 16,
                  text: "هل تشعر بالثقة؟ ستواجه هنا أصعب أسئلتنا!"),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizQuestion()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(color: blue, size: 18, text: "تابع"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
