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
                      leading: Icon(Icons.card_membership,size: 40,),
                      title: Text(" Total Cases" ,style: Theme.of(context).textTheme.title,),
                      trailing: FittedBox(child: Text("${data.data["cases"]}",style: Theme.of(context).textTheme.title,)),
                    ),
                  ),
                  Card(
                                      child: ListTile(
                      leading: Icon(Icons.directions_walk,size: 40,),
                      title: Text(" Total Deaths",style: Theme.of(context).textTheme.title,),
                       trailing: Text("${data.data["deaths"]}",style: Theme.of(context).textTheme.title,),
                    ),
                  ),
                  Card(
                                      child: ListTile(
                      leading: Icon(Icons.record_voice_over,size: 40,),
                      title: FittedBox(child: Text(" Total Recovered",style: Theme.of(context).textTheme.title,)),
                      trailing: Text("${data.data["recovered"]}",style: Theme.of(context).textTheme.title,),
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
