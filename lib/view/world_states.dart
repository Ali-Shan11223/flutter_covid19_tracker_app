import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        PieChart(
          dataMap: const {
            'Total Cases': 20,
            'Recovered': 5,
            'Deaths': 14,
          },
          animationDuration: const Duration(milliseconds: 1200),
          colorList: const [
            Colors.blue,
            Colors.green,
            Colors.red,
          ],
          legendOptions:
              const LegendOptions(legendPosition: LegendPosition.left),
          chartRadius: size.width / 3,
          chartType: ChartType.ring,
        )
      ],
    )));
  }
}
