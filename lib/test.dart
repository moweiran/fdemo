import 'dart:html';

import 'package:flutter/material.dart';

class TestWidgeet extends StatefulWidget {
  final Object name;
  const TestWidgeet({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _TestWidgeetState createState() => _TestWidgeetState();
}

class _TestWidgeetState extends State<TestWidgeet> {
  late final Object state;

  @override
  void initState() {
    state = widget.name;
    // print('initState333');
    super.initState();
  }

  /// The framework always calls [build] after calling [didUpdateWidget], which
  /// means any calls to [setState] in [didUpdateWidget] are redundant.

  @override
  void didUpdateWidget(covariant TestWidgeet oldWidget) {
    state = "2";
    // state = widget.name;
    print('did update widget');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: const Text("My name is "),
            ),
            TextButton(
              onPressed: () {
                // this.state ++;
              },
              child: const Text('click'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget2 extends StatelessWidget {
  final String name;
  const TestWidget2({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
