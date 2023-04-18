import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/size_config.dart';
import '../../../style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/mac-action.svg'),
                ),
              ),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/home.svg',
                    color: Color.fromRGBO(199, 163, 212, 1),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Dashboard");
                  }),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/pie-chart.svg',
                    color: Color.fromRGBO(199, 163, 212, 1),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/ListUsers");
                  }),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/clipboard.svg',
                    color: Color.fromRGBO(199, 163, 212, 1),
                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/credit-card.svg',
                    color: Color.fromRGBO(199, 163, 212, 1),
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
