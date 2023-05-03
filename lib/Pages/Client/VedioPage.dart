import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

import '../../Service/QuestionsService.dart';
import '../../style/colors.dart';
import 'VideoWidgetYou.dart';

class VedioPage extends StatefulWidget {
  const VedioPage({super.key});

  @override
  State<VedioPage> createState() => _VedioPageState();
}

class _VedioPageState extends State<VedioPage> {
  bool payload = false;
  bool _isPlaying = false;
  var vedioList;
  String url = "";
  bool _disposed = false;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    QuestionService ques = QuestionService();
    vedioList = ques.getAllVideo();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: vedioList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;

                return Container(
                  decoration: payload == false
                      ? const BoxDecoration(
                          gradient: LinearGradient(
                              colors: AppColors.kclipath,
                              begin: FractionalOffset(0.0, 0.4),
                              end: Alignment.topRight),
                        )
                      : const BoxDecoration(color: AppColors.gradiantSecond),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        payload == false
                            ? Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  child: const Text(
                                    "فيديوهات تعلم السياقة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Center(
                                widthFactor: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 270,
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Row(
                                        children: [
                                          if (url.contains('youtube.com') ||
                                              url.contains('youtu.be/'))
                                            VedioYout(url),
                                          if (!url.contains('youtube.com'))
                                            _playView(context),
                                        ],
                                      ),
                                    ),
                                    Center(child: _controllerView(context)),
                                  ],
                                ),
                              ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40))),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.video_collection,
                                        color: Colors.black38),
                                    const Text(
                                      "فيديوهات ة",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 8),
                                      itemCount: 4,
                                      itemBuilder: (_, int index) {
                                        return GestureDetector(
                                            onTap: () {
                                              onTapVedio(index,
                                                  data[index]["VideoUrl"]);
                                              if (payload == false) {
                                                setState(() {
                                                  payload = true;
                                                  url = data[index]["VideoUrl"];
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 140,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 80,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/road.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 30),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("hello",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 3),
                                                                child: Text(
                                                                    "time",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey[400])))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 18,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          width: 80,
                                                          height: 20,
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      199,
                                                                      163,
                                                                      212,
                                                                      1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: const Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            "14 rest",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )),
                                                      Row(
                                                        children: [
                                                          for (int i = 0;
                                                              i < 40;
                                                              i++)
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(1),
                                                              width: 3,
                                                              height: 1,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2)),
                                                            )
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
                );
              } else {
                return Container(
                  child: Text("No Data"),
                );
              }
            }));
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(
        height: 200,
        width: 380,
        child: VideoPlayer(controller),
      );
    } else {
      return Text("Being instialized plz wait ");
    }
  }

  Widget _controllerView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(children: [
        ElevatedButton(
            onPressed: () {},
            child:
                const Icon(Icons.fast_rewind, size: 20, color: Colors.white)),
        ElevatedButton(
            onPressed: () {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller.play();
              }
            },
            child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                size: 20, color: Colors.white)),
        ElevatedButton(
            onPressed: () {},
            child:
                const Icon(Icons.fast_forward, size: 20, color: Colors.white))
      ]),
    );
  }

  void _onControllerUpdate() {
    if (_disposed) {
      return;
    }
    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controlller can No be initialized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  onTapVedio(int index, String url) {
    final controller = VideoPlayerController.network(url);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old.dispose();
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }
}
