import 'package:car/Pages/Admin/component/paymentListTile.dart';
import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import '../../../style/colors.dart';
import '../../../style/style.dart';
import '../../data.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0,
            offset: const Offset(
              10.0,
              15.0,
            ),
          )
        ]),
        child: Image.asset('assets/cart_edinar.jpg'),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Recent Course added',
              size: 18,
              fontWeight: FontWeight.w800),
          PrimaryText(
            text: '02 Mar 2021',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          recentActivities.length,
          (index) => PaymentListTile(
              icon: recentActivities[index]["icon"] as String,
              label: recentActivities[index]["label"] as String,
              amount: recentActivities[index]["amount"] as String),
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Upcoming Payments', size: 18, fontWeight: FontWeight.w800),
          PrimaryText(
            text: '02 Mar 2021',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          upcomingPayments.length,
          (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"] as String,
              label: upcomingPayments[index]["label"] as String,
              amount: upcomingPayments[index]["amount"] as String),
        ),
      ),
    ]);
  }
}
