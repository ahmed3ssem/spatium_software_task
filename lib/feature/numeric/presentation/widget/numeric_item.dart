import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumericCard extends StatelessWidget {
  final String title;
  final String value;

  const NumericCard({super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.sp),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Text(
              value,
              style: TextStyle(
                fontSize: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}