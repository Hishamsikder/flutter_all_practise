import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  final String? secondPage;
  final String? token;
  const SecondPage({super.key, this.token, this.secondPage});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Token : ${widget.token}",textScaler:  TextScaler.linear(2.0),)),
            Center(child: Text("Token : ${widget.secondPage}",textScaler:  TextScaler.linear(2.0),))
          ],
        ),
      ),
    );
  }
}
