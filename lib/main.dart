import 'package:flutter/material.dart';

import './dashboard_screen.dart';

void main(){
  
  runApp(App());

}
/*
no api response...
that app has been brack

*/

class App extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    home: DashBoardScreen(),
    );
  }
}