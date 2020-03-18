import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GlobalScreen extends StatelessWidget {

  Future<dynamic> globalDataGet() async {
    print("object");
    final String url = 'https://corona.lmao.ninja/all';
    var response = await http.get(url);
    

    var data = json.decode(response.body);
    print(data);
    return data;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: globalDataGet(),
        builder: (context, data) {
          if (data.hasData) {
            return Material(
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.card_membership),
                      title: Text(" Total Cases"),
                      trailing: Text("${data.data["cases"]}"),
                    ),
                  ),
                  Card(
                                      child: ListTile(
                      leading: Icon(Icons.card_membership),
                      title: Text(" Total Deaths"),
                       trailing: Text("${data.data["deaths"]}"),
                    ),
                  ),
                  Card(
                                      child: ListTile(
                      leading: Icon(Icons.card_membership),
                      title: Text(" Total Recovered"),
                      trailing: Text("${data.data["recovered"]}"),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
