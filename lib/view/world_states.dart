import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_covid19_tracker/model/world_states_model.dart';
import 'package:flutter_covid19_tracker/services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/states_row.dart';
import 'countries_list.dart';

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
    StatesServices statesServices = StatesServices();
    
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          FutureBuilder(
              future: statesServices.getWorldStates(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                final data = snapshot.data;
                if (!snapshot.hasData) {
                  return Expanded(
                    child: Center(
                      child: SpinKitWave(
                        size: 30,
                        itemCount: 5,
                        color: Colors.white,
                        controller: _controller,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          'Total Cases': double.parse(data!.cases.toString()),
                          'Recovered': double.parse(data.recovered.toString()),
                          'Deaths': double.parse(data.deaths.toString()),
                        },
                        animationDuration: const Duration(milliseconds: 1200),
                        colorList: const [
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                        ],
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        chartRadius: size.width / 3.2,
                        chartType: ChartType.ring,
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Card(
                        child: Column(
                          children: [
                            StatesRow(
                                title: 'Total Cases',
                                value: data.cases.toString()),
                            StatesRow(
                                title: 'Total Recovered',
                                value: data.recovered.toString()),
                            StatesRow(
                                title: 'Total Deaths',
                                value: data.deaths.toString()),
                            StatesRow(
                                title: 'Active', value: data.active.toString()),
                            StatesRow(
                                title: 'Critical',
                                value: data.critical.toString()),
                            StatesRow(
                                title: 'Today Deaths',
                                value: data.todayDeaths.toString()),
                            StatesRow(
                                title: 'Today Recovered',
                                value: data.todayRecovered.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CountriesList()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
        ],
      ),
    )));
  }
}
