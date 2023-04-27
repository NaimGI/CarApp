import 'dart:io';

import 'package:car/Pages/Client/Mokatapage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../Service/PDFApi.dart';
import '../../components/ContentInfo.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
  List<Map<String, dynamic>> str = const [
    {
      "name": Text(
        "المقاطعة",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      ),
      "route": "المقاطعة"
    },
    {
      "name": Text(
        "علامات-الطريق",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      ),
      "route": "علامات-الطريق"
    },
    {
      "name": Text(
        "الأولوية",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      ),
    },
    {
      "name": Text(
        "السرعة",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      ),
    },
    {
      "name": Text(
        "الأولوية",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      ),
    },
    {
      "name": Text(
        "السرعة",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(53, 88, 174, 1)),
      )
    }
  ];
  List<Widget> weg = [
    Image.asset(
      "assets/road.png",
      width: 40,
      height: 40,
    ),
    Image.asset(
      "assets/road2.png",
      width: 40,
      height: 40,
    ),
    Image.asset(
      "assets/speed.png",
      width: 40,
      height: 40,
    ),
    Image.asset(
      "assets/tran.png",
      width: 40,
      height: 40,
    ),
    Image.asset(
      "assets/speed.png",
      width: 40,
      height: 40,
    ),
    Image.asset(
      "assets/tran.png",
      width: 40,
      height: 40,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, right: 40),
            margin: EdgeInsets.all(10),
            child: Text(
              "الممارسة",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            alignment: Alignment.topLeft,
          ),
          Container(
            child: Image.asset(
              "assets/images/Car.png",
              height: 140,
              width: 400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    top: 7,
                    left: 7,
                    right: 7,
                    bottom: 40), // remove space at top
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: weg.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(seconds: 2),
                      child: InkWell(
                        onTap: () async {
                          /*  Navigator.of(context).pushNamed("IndexPage"); */
                          final path = 'assets/Mo9at3aa.pdf';
                          final file = await PDFapi.loadAsset(path);

                          if (str[index]["route"] == "المقاطعة") {
                            openPDF(context, file);
                          } else {
                            Navigator.of(context).pushNamed("/IndexPage");
                          }
                        },
                        child: CounterInfo(weg[index], str[index]["name"]),
                      ));
                },
              ),
            ),
          ),
        ]));
  }
}
