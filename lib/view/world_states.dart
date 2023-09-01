import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/states_row.dart';

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
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            chartRadius: size.width / 3.2,
            chartType: ChartType.ring,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Card(
            child: Column(
              children: [
                StatesRow(title: 'Total Cases', value: '2500'),
                StatesRow(title: 'Total Deaths', value: '2500'),
                StatesRow(title: 'Total Recovered', value: '2500'),
                StatesRow(title: 'Total Deaths', value: '2500'),
                StatesRow(title: 'Total Deaths', value: '2500'),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
              child: Text('Track Countries'),
            ),
          )
        ],
      ),
    )));
  }
}
