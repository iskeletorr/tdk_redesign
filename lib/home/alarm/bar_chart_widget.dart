
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget barChart() {
  return AspectRatio(
    aspectRatio: 2.1,
    child: BarChart(
      BarChartData(
        titlesData: titlesData,
        barGroups: barGroups,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    ),
  );
}

LinearGradient get _barsGradient => const LinearGradient(
      colors: [
        Color(0xFFdf6f43),
        Color(0xFF944a2c),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(width: 14, toY: 13, gradient: _barsGradient)]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(width: 14, toY: 10, gradient: _barsGradient)]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(width: 14, toY: 13, gradient: _barsGradient)]),
      BarChartGroupData(x: 3, barRods: [BarChartRodData(width: 14, toY: 16, gradient: _barsGradient)]),
      BarChartGroupData(x: 4, barRods: [BarChartRodData(width: 14, toY: 12, gradient: _barsGradient)]),
      BarChartGroupData(x: 5, barRods: [BarChartRodData(width: 14, toY: 10, gradient: _barsGradient)]),
      BarChartGroupData(x: 6, barRods: [BarChartRodData(width: 14, toY: 16, gradient: _barsGradient)]),
    ];
Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'M';
      break;
    case 1:
      text = 'T';
      break;
    case 2:
      text = 'W';
      break;
    case 3:
      text = 'T';
      break;
    case 4:
      text = 'F';
      break;
    case 5:
      text = 'S';
      break;
    case 6:
      text = 'S';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, space: 20, child: Text(text, style: style));
}

FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
