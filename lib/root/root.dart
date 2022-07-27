import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_starter/pages/homePage.dart';
import 'package:flutter_api_starter/pages/loginScreen.dart';

enum AuthStatus{
  notLoggedIn,
  LoggedIn
}

class rootApp extends StatefulWidget {
  const rootApp({Key? key}) : super(key: key);

  @override
  State<rootApp> createState() => _rootAppState();
}

class _rootAppState extends State<rootApp> {
  AuthStatus _authStatus  = AuthStatus.notLoggedIn;

@override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    late Widget widgetVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:{
        widgetVal = loginScreen();
        }
        break;
      case AuthStatus.LoggedIn:{
        widgetVal = homePage();
        }
        break;
      default:{
      widgetVal = loginScreen();
      }
    }

    return widgetVal;
  }
}