import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spatium_software_task/config/routes/app_routes.dart';
import 'package:spatium_software_task/config/theme/app_theme.dart';
import 'package:spatium_software_task/core/utils/app_strings.dart';
import 'package:spatium_software_task/core/utils/local_strings.dart';
import 'package:spatium_software_task/feature/graph/presentation/cubit/graph_cubit.dart';
import 'package:spatium_software_task/feature/numeric/presentation/cubit/numeric_cubit.dart';
import 'injection_container.dart' as di;
import 'widgets/message_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<NumericCubit>()),
          BlocProvider(create: (context) => di.sl<GraphCubit>()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context , child){
              return MediaQuery(
                  data:  MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: GetMaterialApp(
                    translations: LocalStrings(),
                    locale: const Locale('en', 'US'),
                    fallbackLocale: const Locale('en', 'US'),
                    theme: appTheme(),
                    debugShowCheckedModeBanner: false,
                    title: AppStrings.appName,
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    scaffoldMessengerKey: MessageWidget.scaffoldMessengerKey,
                  )
              );
            })
    );
  }
}