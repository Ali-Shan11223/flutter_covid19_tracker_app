import 'package:flutter/material.dart';
import 'package:flutter_covid19_tracker/services/states_services.dart';
import 'package:shimmer/shimmer.dart';

import 'detail_screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Affected Countries')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search country name',
              prefixIcon: const Icon(Icons.search, size: 20),
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Expanded(
          child: FutureBuilder(
              future: statesServices.getCountriesList(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.white,
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.grey,
                              ),
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.grey,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data![index];
                        String countryName = data['country'];
                        if (_searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                title: snapshot.data![index]
                                                    ['country'],
                                                flag: data['countryInfo']
                                                    ['flag'],
                                                totalCases: data['cases'],
                                                deaths: data['deaths'],
                                                recovered: data['recovered'],
                                                critical: data['critical'],
                                                tests: data['tests'],
                                                todayRecovered:
                                                    data['todayRecovered'],
                                              )));
                                },
                                child: ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        data['countryInfo']['flag']),
                                  ),
                                  title: Text(data['country']),
                                  subtitle: Text(data['cases'].toString()),
                                ),
                              )
                            ],
                          );
                        } else if (countryName
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                title: data['country'],
                                                flag: data['countryInfo']
                                                    ['flag'],
                                                totalCases: data['cases'],
                                                deaths: data['deaths'],
                                                recovered: data['recovered'],
                                                critical: data['critical'],
                                                tests: data['tests'],
                                                todayRecovered:
                                                    data['todayRecovered'],
                                              )));
                                },
                                child: ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        data['countryInfo']['flag']),
                                  ),
                                  title: Text(data['country']),
                                  subtitle: Text(data['cases'].toString()),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      });
                }
              }),
        )
      ]),
    );
  }
}
