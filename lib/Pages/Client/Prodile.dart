import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../components/MyClipper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
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
                      "الإعدادات",
                      style: TextStyle(fontSize: 27, color: Colors.white),
                    )))),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.5.h),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_left,
                            size: 34,
                            color: Color(0xFF757575),
                          ),
                        ]),
                    title: Center(
                      child: Text(
                        "أسئلة",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        "كل أسئلتك.",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.sports_gymnastics_rounded),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/Profile");
                    },
                    leading: Icon(
                      Icons.arrow_left,
                      size: 34,
                      color: Color(0xFF757575),
                    ),
                    title: const Center(
                      child: Text(
                        "الإعدادات",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: const Center(
                      child: Text(
                        "تعديل بياناتك",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.settings),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
