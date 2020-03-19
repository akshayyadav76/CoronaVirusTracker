import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class ChartScreen extends StatelessWidget {
  List<charts.Series<PieData, String>> seriesList;
   List<PieData> dataList = [];

  countriesData() async {

    seriesList.clear();
    dataList.clear();
    print("object");
    final url = 'https://corona.lmao.ninja/countries';
    var response = await http.get(url);

    var getData = json.decode(response.body);
    print(getData);
    print(getData.length);

    for (int i = 0; i < getData.length; i++) {
      print("dfdff");
      print("${getData[i]['cases']}");
      print(i);
      try {
        dataList.add(PieData(
          country: getData[i]['country'],
          cases: getData[i]['cases'],
          todayCases: getData[i]['todayCases'],
          deaths: getData[i]['deaths'],
          todayDeaths: getData[i]['todayDeaths'],
          recovered: getData[i]['recovered'],
          critical: getData[i]['critical'],
        ));
      } catch (e) {
        print("thie what er $e");
      }
    }
    print(' parse json list ${dataList[2].cases}');
    print("adter loop");
    seriesList = List<charts.Series<PieData, String>>();
    try {
      //  for(int i=0;i<=dataList.length; i++){
      seriesList.add(charts.Series(
        id: 'Corona Data',
        data: dataList,
        domainFn: (PieData pieData, _) => pieData.country,
        measureFn: (PieData pieData, _) => pieData.cases,
        labelAccessorFn: (PieData pieData, _) => '${pieData.country}',
      )); //}
    } catch (e) {
      print("adter loop try $e");
    }
    print("series data ${seriesList.length}");

    return true;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countriesData(),
      builder: (context, respons) {
        if (respons.hasData) {
          return Column(
            children: <Widget>[
              Text("Total Cases in countries"),
              Expanded(
                child: charts.PieChart(seriesList,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    defaultRenderer: charts.ArcRendererConfig(
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.auto)
                        ])),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class PieData {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int critical;

  PieData({
    this.cases,
    this.country,
    this.critical,
    this.deaths,
    this.recovered,
    this.todayCases,
    this.todayDeaths,
  });
}
