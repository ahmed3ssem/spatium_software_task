import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spatium_software_task/core/utils/app_colors.dart';

class NumericCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String image;

  const NumericCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: ConstrainedBox(
        constraints:   BoxConstraints(maxHeight: ScreenUtil().setHeight(70), minHeight: ScreenUtil().setHeight(70)), // Adjust the height as needed
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.black, fontSize: 16.sp),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  children: [
                    Image.asset(image, width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15)),
                    SizedBox(width: ScreenUtil().setWidth(5)),
                    Text(
                      value,
                      style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

