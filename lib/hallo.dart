import 'package:flutter/material.dart';

class HalloPage extends StatelessWidget {
  final String? message;

  HalloPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hallo Page"),
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
