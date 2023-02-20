import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  final String? message;

  HelloPage({Key? key, required this.message}) : super(key: key);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  void initState() {
    super.initState();
  }

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
              'Xin chào: \n ${widget.message}',
            ),
          ],
        ),
      ),
    );
  }
}
