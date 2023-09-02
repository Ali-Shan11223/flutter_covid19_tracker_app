import 'package:flutter/material.dart';

import '../widgets/states_row.dart';

class DetailScreen extends StatefulWidget {
  dynamic  title;
  dynamic  flag;
  dynamic totalCases;
  dynamic deaths;
  dynamic recovered;
  dynamic critical;
  dynamic todayRecovered;
  dynamic tests;

   DetailScreen(
      {super.key,
      required this.title,
      required this.flag,
      required this.totalCases,
      required this.deaths,
      required this.recovered,
      required this.critical,
      required this.todayRecovered,
      required this.tests});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title['title']),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Column(children: [
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      StatesRow(
                          title: 'Total Cases',
                          value: widget.totalCases['totalCases'].toString()),
                      StatesRow(
                          title: 'Deaths', value: widget.deaths['deaths'].toString()),
                      StatesRow(
                          title: 'Recovered',
                          value: widget.recovered['recovered'].toString()),
                      StatesRow(
                          title: 'Critical', value: widget.critical['critical'].toString()),
                      StatesRow(
                          title: 'Today Recovered',
                          value: widget.todayRecovered['todayRecovered'].toString()),
                      StatesRow(title: 'Tests', value: widget.tests['tests'].toString()),
                    ]),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.flag['flag']),
                )
              ],
            )
          ]),
    );
  }
}
