import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series<dynamic, num>> seriesList;
  final bool animate;

  const SimpleLineChart(this.seriesList, {super.key, required this.animate});

  factory SimpleLineChart.create(Map<String, int> monthFrequency) {
    final List<charts.Series<dynamic, num>> seriesData = [
      charts.Series<dynamic, num>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (dynamic sales, int? index) => index! + 1,
        measureFn: (dynamic sales, int? index) => monthFrequency.values.elementAt(index!),
        data: List.generate(monthFrequency.length, (index) => index),
        labelAccessorFn: (dynamic sales, int? index) {
          final month = DateFormat.MMM().format(DateTime.parse('2022-${index! + 1}-01'));
          return '$month: $sales';
        },
      )
    ];

    return SimpleLineChart(
      seriesData,
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
        includeArea: true,
        strokeWidthPx: 2.0,
      ),
      behaviors: const [
        // ... (other behaviors remain the same)
      ],
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(desiredTickCount: 12), // Show a tick for each month
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.gray.shade800,
            fontSize: 10,
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.gray.shade800,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}





