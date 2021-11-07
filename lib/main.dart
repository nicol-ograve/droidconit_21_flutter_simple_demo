import 'package:droidconit_21_flutter_simple_demo/routing/app_route_information_parser.dart';
import 'package:droidconit_21_flutter_simple_demo/routing/app_router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        routerDelegate: AppRouterDelegate(),
        routeInformationParser: AppRouteInformationParser());
  }
}
