import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CounterisScreen extends StatelessWidget {
  countriesData() async {
    print("object");
    final url = 'https://corona.lmao.ninja/countries';
    var response = await http.get(url);

    var getData = json.decode(response.body);
    print(getData);
    return getData;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: countriesData(),
        builder: (context, countriesData) {
          if (countriesData.hasData) {
            return ListView.builder(
                itemCount: countriesData.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5,),
                        Text(
                          countriesData.data[i]['country'],
                          style: TextStyle(fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Cases ${countriesData.data[i]['cases']}",
                              style: TextStyle(color: Colors.orange,fontSize: 20),
                            ),
                            Text(
                              "Today Cases ${countriesData.data[i]['todayCases']}",
                              style: TextStyle(color: Colors.orange,fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Deaths ${countriesData.data[i]['deaths']}",
                              style: TextStyle(color: Colors.red,fontSize: 20),
                            ),
                            Text(
                              "Today Deaths ${countriesData.data[i]['todayDeaths']}",
                              style: TextStyle(color: Colors.red,fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Recovered ${countriesData.data[i]['recovered']}",
                              style: TextStyle(color: Colors.green,fontSize: 20),
                            ),
                            Text(
                              "Critical ${countriesData.data[i]['critical']}",
                              style: TextStyle(color: Colors.lime,fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
