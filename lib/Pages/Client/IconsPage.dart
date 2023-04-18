import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/CourceWidget.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "/IndexPage";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Map<String, dynamic>> name = [
    {
      "image": Image(
        image: AssetImage("assets/Wo9ofwTwa9ef.jpeg"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-الوقوف-والتوقف"
    },
    {
      "image": Image(
        image: AssetImage("assets/Mana3.jpeg"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-المنع-و-انتهاء-المنع"
    },
    {
      "image": Image(
        image: AssetImage("assets/Khatar.jpg"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-الخطر"
    },
    {
      "image": Image(
        image: AssetImage("assets/awlawiya.jpg"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-الأولوية"
    },
    {
      "image": Image(
        image: AssetImage("assets/wa9tiya.png"),
        width: 49,
        height: 49,
      ),
      "text": "العلامات-الوقتية"
    },
    {
      "image": Image(
        image: AssetImage("assets/irchaad.jpeg"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-الإرشاد"
    },
    {
      "image": Image(
        image: AssetImage("assets/Jaber.png"),
        width: 49,
        height: 49,
      ),
      "text": "علامات-الجبر-و-انتهاء-الجبر"
    }
  ];
  Future<void> getData() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    backgroundColor: Color.fromRGBO(199, 163, 212, 1),
                    expandedHeight: 280.0,
                    floating: false,
                    pinned: true,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.parallax,
                        title: Container(
                          // margin: const EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                            top: 34,
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "علامات الطريق",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 23.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(13.w)))),
                        ),
                        background: Image.network(
                          "https://th.bing.com/th/id/R.912cc6c80090bece0d6f16ad76a36b69?rik=GYnN05wuK%2fWyjg&pid=ImgRaw&r=0",
                          fit: BoxFit.cover,
                        ))),
              ];
            },
            body: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 238, 238, 238),
              child: RefreshIndicator(
                  onRefresh: getData,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return CourceWidget(
                          name[index]["image"], name[index]["text"]);
                    },
                  )),
            )));
  }
}
