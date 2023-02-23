import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  final String? message;

  HelloPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Xin chào: \n $message',
            ),
          ],
        ),
      ),
    );
  }
}
