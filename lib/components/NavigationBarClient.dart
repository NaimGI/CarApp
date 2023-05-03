import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../Pages/Client/DocumentPage.dart';
import '../Pages/Client/Mokatapage.dart';
import '../Pages/Client/Prodile.dart';
import '../Pages/Client/QuestionPage.dart';
import '../Pages/Client/VedioPage.dart';
import '../Service/PDFApi.dart';
import '../Service/auth.dart';

class NavigateBarPatient extends StatefulWidget {
  const NavigateBarPatient({Key? key}) : super(key: key);
  static const routeName = '/NavigationClient';
  @override
  State<NavigateBarPatient> createState() => _NavigateBarPatientState();
}

class _NavigateBarPatientState extends State<NavigateBarPatient> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);
  var selectedfABLocation = FloatingActionButtonLocation.endFloat;
  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    DocumentPage(),
    QuestionPage(),
    Page4(),
    Profile(),
    VedioPage()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            PopupMenuButton(
                iconSize: 25,
                color: Colors.grey,
                icon: Icon(
                  Icons.settings,
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.manage_accounts,
                              color: Colors.black,
                            ),
                            Text("Logout"),
                          ]),
                      onTap: () {
                        print('cc');
                        AuthService.logout(context);
                      },
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.black,
                            ),
                            Text("test")
                          ]),
                      onTap: () async {},
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                  } else if (value == 1) {
                    /*  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PdfViewerPage(pdfAssetPath: 'assets/Mo9at3aa.pdf'),
                      ),
                    ); */
                  } else if (value == 2) {
                    print("Logout menu is selected.");
                  }
                }),
          ])
        ],
      ),
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: Color.fromRGBO(199, 163, 212, 1),
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.document_scanner,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.menu_book_sharp,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.menu_book_sharp,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.punch_clock,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.video_camera_back,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.video_camera_back,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                print(index);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(child: Image.asset('assets/construction.png')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(child: Image.asset('assets/construction.png')));
  }
}
