import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VedioPage extends StatefulWidget {
  const VedioPage({super.key});

  @override
  State<VedioPage> createState() => _VedioPageState();
}

class _VedioPageState extends State<VedioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [],
              begin: FractionalOffset(0.0, 0.4),
              end: Alignment.topRight),
        ),
        child: Column(children: [
          Container(
            child: const Text(
              "Vedio",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Vedio",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(Icons.video_collection, color: Colors.white)
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                              onTap: () {
                                debugPrint(index.toString());
                              },
                              child: Container(
                                height: 134,
                                width: 200,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 89,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/road.png"))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("hello",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3),
                                                child: Text("time",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400])))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        }),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
