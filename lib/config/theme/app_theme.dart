import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spatium_software_task/core/utils/app_colors.dart';
import 'package:spatium_software_task/core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    // main color in app
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.grey,
      fontFamily: AppStrings.fontName,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          iconTheme:  IconThemeData(
            color: AppColors.black,
            size: 18.sp
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 16.sp , fontWeight: FontWeight.w400 , color: AppColors.black),
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: TextTheme(
          bodyMedium: TextStyle(height: 1.3 , fontSize: 22.sp , color: AppColors.black , fontWeight: FontWeight.bold),
          labelLarge: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500
          )
      )
  );
}