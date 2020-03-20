import 'package:flutter/material.dart';

import './global_screen.dart';
import './counters_screen.dart';
import './chart_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardScreen extends StatefulWidget {
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;

  List<Widget> widgetsList = [GlobalScreen(), CounterisScreen(), ChartScreen()];

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
         return true;
    }else if(connectivityResult == ConnectivityResult.none){
     var dilog = AlertDialog(content: Text("Please turn on Internet and Restart the App"),
     );

      showDialog(
        barrierDismissible: false,
        context:context,builder: (df){
        return dilog;
      } );
      
    }
    return true;
  }

  _launchURL() async {
  const url = 'https://github.com/akshayyadav76/CoronaVirusTracker';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  Widget build(BuildContext context) {
    print("dd $currentIndex");
    checkInternet();
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronaVirus Tracker "),
        centerTitle: true,
        actions: <Widget>[IconButton(icon: Icon(Icons.info), onPressed: (){
          _launchURL();
        })],
      ),
      body: widgetsList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Center(child: Text("Global")),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Center(child: Text("Counteris")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Center(child: Text("Chart")),
          ),
        ],
        onTap: (num) {
          setState(() {
            print(num);
            currentIndex = num;
            print(currentIndex);
          });
        },
      ),
    );
  }
}
