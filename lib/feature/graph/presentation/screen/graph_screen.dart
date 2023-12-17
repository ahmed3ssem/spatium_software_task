import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spatium_software_task/feature/graph/presentation/cubit/graph_cubit.dart';
import 'package:spatium_software_task/feature/graph/presentation/widget/graph_item.dart';
import 'package:spatium_software_task/widgets/error_widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

  getData() =>BlocProvider.of<GraphCubit>(context).getData();
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget graphWidget(){
    return BlocBuilder<GraphCubit, GraphState>(
        builder: ((context, state) {
          if (state is GraphLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GraphError) {
            return ErrorWidgetItem(onTap: (){getData();},);
          } else if (state is GraphLoaded) {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(400),
                child: SimpleLineChart.create(state.monthFrequency),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('graph'.tr),
      ),
      body: graphWidget(),
    );
  }
}
