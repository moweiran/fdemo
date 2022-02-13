import 'package:flutter/material.dart';
import 'dart:async';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool flag = false;

  @override
  void initState() {
    // changes flag asynchronously
    Timer(Duration(seconds: 1), () {
      setState(() {
        flag = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Column(
        children: [
          Builder(builder: (context) {
            if (flag) {
              return const Text('before');
            }

            return Container();
          }),

          // Middle widget called initState() twice!
          Middle(),

          Builder(builder: (context) {
            if (flag) return Text('before');
            return Container();
          }),
        ],
      ),
    );
  }
}

class Middle extends StatefulWidget {
  Middle({
    Key? key,
  }) : super(key: key);
  @override
  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  @override
  void initState() {
    print('initState -------------');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose XXXXXXXXXXXXXX');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Middle'),
    );
  }
}
