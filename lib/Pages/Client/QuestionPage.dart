import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../components/MyClipper.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String searchKey = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          colors: [
                        Color.fromRGBO(42, 37, 92, 1),
                        Color.fromRGBO(182, 64, 116, 1)
                      ])),
                  child: const Center(
                      child: Text(
                    "التطبيق",
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  )))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) {
                    //Update The state And Change The SearchKey Value which we are  chek in the Stream
                    setState(
                      () {
                        searchKey = value;
                      },
                    );
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    hintText: "Recherche",
                    suffixIcon: const Icon(Icons.search),
                    //prefix: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              )),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(7),
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x3416202A),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(3.w),
                        shape: BoxShape.rectangle,
                      ),
                      child: ListTile(
                          leading: Text(
                            "20%",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          title: Center(
                            child: Text(
                              "test",
                            ),
                          ),
                          trailing: Icon(Icons.question_answer,
                              size: 29,
                              color: Color.fromRGBO(199, 163, 212, 1)),
                          onTap: () {
                            Navigator.of(context).pushNamed("/quiz");
                          }));
                }),
          ),
        ],
      ),
    );
  }
}
