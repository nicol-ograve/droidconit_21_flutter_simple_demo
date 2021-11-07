import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body:
            Padding(padding: EdgeInsets.all(16), child: Text('Error page')));
  }
}
