import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});
  static const routName = "/Profile";

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(182, 64, 116, 1),
          centerTitle: true,
          title: const Text("Paramètres")),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            showModalBottomSheet(
                context: context, builder: (ctx) => BottomSheetImageWidget());
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/irchaad.jpeg"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              ),
                              color: Color(0xFF257099)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/Update");
                },
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
                title: const Text(
                  "حسابي الشخصي",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "إدارة الملف الشخصي",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color(0xFF757575),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/mdp");
                },
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.security),
                ),
                title: const Text(
                  "الخصوصية والأمان",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "عديل كلمة المرور الخاصة بك",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

Widget BottomSheetImageWidget() {
  return Container(
    height: 100,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Column(
      children: [
        const Text(
          "اختيار صورة الحساب الشخصي",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              icon: Icon(
                Icons.camera,
              ),
              label: Text(
                "Camera",
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              icon: Icon(
                Icons.image,
              ),
              label: Text("Galery"),
            ),
          ],
        )
      ],
    ),
  );
}
