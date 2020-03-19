import 'package:flutter/material.dart';

import './global_screen.dart';
import './counters_screen.dart';
import './chart_screen.dart';

class DashBoardScreen extends StatefulWidget {

  
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  int currentIndex = 0;

  List<Widget> widgetsList =[
    GlobalScreen(),
    CounterisScreen(),
    ChartScreen()
  ];

  Widget build(BuildContext context) {
    print("dd $currentIndex");
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronaVirus Tracker "),
        centerTitle: true,
      ),
      body: widgetsList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        items: 
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Center(child: Text("Global")),backgroundColor: Colors.purple,
             ),


             BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Center(child: Text("Counteris")), ),

            BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Center(child: Text("Chart")), ),
        ],
        onTap: (num){
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
