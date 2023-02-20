import 'package:flutter/material.dart';

class HalloPage extends StatefulWidget {
  final String? message;

  HalloPage({Key? key, required this.message}) : super(key: key);

  @override
  _HalloPageState createState() => _HalloPageState();
}

class _HalloPageState extends State<HalloPage> {
  @override
  void initState() {
    super.initState();
  }

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
              'Xin chào: \n ${widget.message}',
            ),
          ],
        ),
      ),
    );
  }
}
