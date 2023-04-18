import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class CourceWidget extends StatelessWidget {
  final Widget wed;
  final String text;
  CourceWidget(this.wed, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(7),
        padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x3416202A),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(3.w),
          shape: BoxShape.rectangle,
        ),
        child: ListTile(
            leading: true
                ? Icon(
                    Icons.check_circle,
                    color: Colors.grey,
                  )
                : Icon(
                    Icons.check_circle_outline,
                    color: Colors.green[700],
                  ),
            title: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing: wed,
            onTap: () {}));
  }
}
