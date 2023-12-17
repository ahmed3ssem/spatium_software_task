import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spatium_software_task/core/utils/app_colors.dart';
import 'package:spatium_software_task/core/utils/assets_manager.dart';

class NumericCard extends StatelessWidget {
  final String title;
  final String value;

  final Color color;

  const NumericCard({super.key,
    required this.title,
    required this.value,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10) , vertical: ScreenUtil().setHeight(10)),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(3)),
            child: Text(title , style: TextStyle(fontWeight: FontWeight.w700 , color: AppColors.black , fontSize: 16.sp),),
          ),
          Row(
            children: [
              Image.asset(AssetsManager.numeric , width: ScreenUtil().setWidth(15),height: ScreenUtil().setHeight(15),),
              SizedBox(width: ScreenUtil().setWidth(5),),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                child: Text(value, style: TextStyle(fontWeight: FontWeight.w400 , color: AppColors.black , fontSize: 14.sp),),
              )
            ],
          )
        ],
      ),
    );
  }
}