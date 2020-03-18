import 'package:flutter/material.dart';

import './dashboard_screen.dart';

void main(){
  
  runApp(App());

}

class App extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    home: DashBoardScreen(),
    );
  }
}