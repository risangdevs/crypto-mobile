import 'package:crypto_mobile/models/asset_models.dart';
import 'package:crypto_mobile/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceChart extends StatelessWidget {
  final List<HistoricalData> priceData;

  PriceChart({required this.priceData});
  @override
  Widget build(BuildContext context) {
  print(priceData);
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text(DateFormat('MM-dd').format(date));
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: priceData
                .map((data) => FlSpot(data.time.toDouble(), stringToDouble(data.priceUsd) ?? 0.0))
                .toList(),
            isCurved: true,
            barWidth: 2,
            color: Colors.blue,
            // dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
