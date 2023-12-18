import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:spatium_software_task/feature/numeric/data/datasources/numeric_remote_data_source.dart';
import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';
import 'package:spatium_software_task/feature/numeric/data/models/orders_model.dart';

class NumericRemoteDataSourceImpl extends NumericRemoteDataSource {

NumericRemoteDataSourceImpl();

  @override
  Future<NumericModel> calculateNumerics() async{
    final jsonString = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<OrdersModel> ordersList = jsonList.map((e) => OrdersModel.fromJson(e)).toList();
    final totalCount = getTotalCount(ordersList);
    final averagePrice = getAveragePrice(ordersList);
    final numberOfReturns = getNumberOfReturns(ordersList);
    final buyerNumber = countUniqueBuyers(ordersList);
    NumericModel numericModel = NumericModel(totalCount: totalCount, averagePrice: averagePrice, numberOfReturns: numberOfReturns , buyerNumber: buyerNumber);
    return numericModel;
  }

 int getTotalCount(List<dynamic> items) {
   return items.length;
 }

double parsePrice(String priceString) {
  final cleanedString = priceString.replaceAll(RegExp(r'[^0-9.]'), '');
  return double.parse(cleanedString);
}

 double getAveragePrice(List<dynamic> items) {
   final totalPrice = items.fold(0.0, (prev, item) => prev + parsePrice(item.price));
   final average = totalPrice / items.length;
   return double.parse(average.toStringAsFixed(3));
 }

  int getNumberOfReturns(List<dynamic> items) {
    return items.where((element) => element.status == 'RETURNED').length;
 }

int countUniqueBuyers(List items) {
  Set<String> uniqueBuyers = <String>{};

  for (var item in items) {
    uniqueBuyers.add(item.buyer);
  }

  return uniqueBuyers.length;
}
}
