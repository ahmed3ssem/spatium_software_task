import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NumericCard(
                    title: 'Total Count',
                    value: state.numericModel.totalCount.toString(),
                  ),
                  NumericCard(
                    title: 'Average Price',
                    value: state.numericModel.averagePrice.toString(),
                  ),
                  NumericCard(
                    title: 'Number of Returns',
                    value: state.numericModel.numberOfReturns.toString(),
                  ),
                ],
              ),
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
      appBar: AppBar(
        title: Text('numericScreen'.tr),
      ),
      body: numericWidget(),
    );
  }
}
