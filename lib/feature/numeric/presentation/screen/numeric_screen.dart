import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spatium_software_task/config/routes/app_routes.dart';
import 'package:spatium_software_task/core/utils/app_colors.dart';
import 'package:spatium_software_task/feature/numeric/presentation/cubit/numeric_cubit.dart';
import 'package:spatium_software_task/feature/numeric/presentation/widget/numeric_item.dart';
import 'package:spatium_software_task/widgets/error_widget.dart';

class NumericScreen extends StatefulWidget {
  const NumericScreen({super.key});

  @override
  State<NumericScreen> createState() => _NumericScreenState();
}

class _NumericScreenState extends State<NumericScreen> {

  getData() =>BlocProvider.of<NumericCubit>(context).getData();

  Widget numericWidget(){
    return BlocBuilder<NumericCubit, NumericState>(
        builder: ((context, state) {
          if (state is NumericIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NumericError) {
            return ErrorWidgetItem(onTap: (){getData();},);
          } else if (state is NumericLoaded) {
            return Column(
              children: [
                NumericCard(
                  title: 'totalCount'.tr,
                  value: state.numericModel.totalCount.toString(),
                  color: AppColors.itemOneColor,
                ),
                NumericCard(
                  title: 'averagePrice'.tr,
                  value: state.numericModel.averagePrice.toString(),
                  color: AppColors.itemTwoColor,
                ),
                NumericCard(
                  title: 'numberOfReturns'.tr,
                  value: state.numericModel.numberOfReturns.toString(),
                  color: AppColors.itemThreeColor,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor2,
        onPressed: ()=>Navigator.pushNamed(context, Routes.graphRoutes),
        child: Icon(Icons.bar_chart , size: 18.sp, color:  AppColors.whiteColor,),
      ),
      appBar: AppBar(
        title: Text('numericScreen'.tr),
      ),
      body: numericWidget(),
    );
  }
}
