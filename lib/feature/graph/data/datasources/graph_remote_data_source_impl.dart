import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:spatium_software_task/feature/graph/data/datasources/graph_remote_data_source.dart';
import 'package:spatium_software_task/feature/numeric/data/models/orders_model.dart';

class GraphRemoteDataSourceImpl extends GraphRemoteDataSource {

GraphRemoteDataSourceImpl();

  @override
  Future<Map<String, int>> getGraphData() async{
    final jsonString = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<OrdersModel> ordersList = jsonList.map((e) => OrdersModel.fromJson(e)).toList();
    Map<String, int> monthFrequency = calculateMonthFrequency(ordersList);
    return monthFrequency;
  }

Map<String, int> calculateMonthFrequency(List<OrdersModel> items) {
  Map<String, int> monthFrequency = {};
  for (var item in items) {
    if (item.status != 'RETURNED') {
      final DateTime registeredDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(item.registered);
      final month = DateFormat('MMM').format(registeredDate);
      monthFrequency[month] = (monthFrequency[month] ?? 0) + 1;
    }
  }
  return monthFrequency;
}
}
