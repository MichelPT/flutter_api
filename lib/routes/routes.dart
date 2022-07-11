import 'package:flutter/material.dart';
import 'package:flutter_api_starter/pages/homePage.dart';
import 'package:flutter_api_starter/pages/loginScreen.dart';
import 'package:flutter_api_starter/pages/postData.dart';
import 'package:flutter_api_starter/pages/registerscreen.dart';

class RouteGenerator {
 static Route<dynamic> generateRoute(RouteSettings settings) {
 switch (settings.name) {
 case '/loginScreen':
 return MaterialPageRoute(builder: (_) => loginScreen());
 case '/registerScreen':
 return MaterialPageRoute(builder: (_) => registerScreen());
 case '/homePage':
 return MaterialPageRoute(builder: (_) => homePage());
 case '/postData':
 return MaterialPageRoute(builder: (_) => postData());
 default:
 return _errorRoute();
 }
 
 }
 static Route<dynamic> _errorRoute() {
 return MaterialPageRoute(builder: (_) {
 return Scaffold(
      appBar: AppBar(title: Text("Error")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text('Error Page',
            style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: Image.asset('assets/images/error.png',
            width: 500,
            ),
          ),
          Center(
            child: Text('Please try again later'),
          )
        ],
      ),
      );
 });
 }
}