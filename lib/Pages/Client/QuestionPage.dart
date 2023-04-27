import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../Service/QuestionsService.dart';
import '../../components/MyClipper.dart';
import '../../style/colors.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String searchKey = "";
  late Future quiz;
  @override
  void initState() {
    super.initState();
    QuestionService ques = QuestionService();
    quiz = ques.getAllQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: quiz,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Column(
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
                        itemCount: data.length,
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
                                      data[index]["Name"],
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(data[index]["image"]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/quiz");
                                  }));
                        }),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
          }),
    );
  }
}
