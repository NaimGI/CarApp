import 'package:flutter/material.dart';

import 'SingUpForm.dart';
import 'leadingPage.dart';

class OnboardContent extends StatefulWidget {
  OnboardContent();
  static const routName = "/Content";

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 420 + progress * 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    LandingContent(),
                    SignUpForm(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            height: 46,
            bottom: 30 + progress * 140,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if (_pageController.page == 0) {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease);
                }
              },
              child: Opacity(
                  opacity: 1 - progress,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.4, 0.8],
                        colors: [
                          Color.fromRGBO(42, 37, 92, 1),
                          Color.fromRGBO(182, 64, 116, 1)
                        ],
                      ),
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 92 + progress * 32,
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                const Text("Get Started"),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
