/// Forward pattern hatch bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Forward hatch pattern horizontal bar chart example.
///
/// The second series of bars is rendered with a pattern by defining a
/// fillPatternFn mapping function.
class HorizontalPatternForwardHatchBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;

  HorizontalPatternForwardHatchBarChart(this.seriesList);

  factory HorizontalPatternForwardHatchBarChart.withSampleData() {
    return HorizontalPatternForwardHatchBarChart(
      _createSampleData(),
      // Disable animations for image tests.
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('Ca', 1800),
      OrdinalSales('IL', 1000),
      OrdinalSales('NY', 2200),
    ];

    final tableSalesData = [
      OrdinalSales('Ca', 2700),
      OrdinalSales('IL', 1900),
      OrdinalSales('NY', 3600),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        fillPatternFn: (OrdinalSales sales, _) =>
            charts.FillPatternType.forwardHatch,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
