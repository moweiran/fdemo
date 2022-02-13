import 'dart:ffi';

import 'package:fdemo/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: Center(
              child: Text('abc'),
            ),
          ),
          LoginForm()
        ],
      ),
      persistentFooterButtons: const [Text("data")],
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController? userNameCtrl = TextEditingController();
  final TextEditingController? passwordCtrl = TextEditingController();
  final btnDisabled = true;
  final String btnText = '确定';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'abc',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          TextFormField(
            maxLength: 20,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: '请输入账号',
              hintStyle: TextStyle(fontSize: 12),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
              errorText: '请输入正确格式的账号',
            ),
            controller: userNameCtrl,
            validator: (String? value) {
              if (value == null || value == '') return '';
            },
          ),
          TextFormField(
            obscureText: true,
            obscuringCharacter: '!',
            decoration: const InputDecoration(
              hintText: '请输入密码',
              hintStyle: TextStyle(fontSize: 12),
              errorText: '请输入正确的密码',
            ),
            controller: passwordCtrl,
            validator: (String? value) {
              if (value == null || value == '') return '';
            },
          ),
          LoginSubmitButton(
            btnText: btnText,
            btnDisabled: btnDisabled,
          )
        ],
      ),
    );
  }
}

class LoginSubmitButton extends StatefulWidget {
  final String btnText;
  final bool btnDisabled;
  const LoginSubmitButton(
      {Key? key, required this.btnText, required this.btnDisabled})
      : super(key: key);

  @override
  _LoginSubmitButtonState createState() => _LoginSubmitButtonState();
}

class _LoginSubmitButtonState extends State<LoginSubmitButton> {
  @override
  void initState() {
    print('initState');
    print(widget.btnDisabled);
    print(widget.btnText);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoginSubmitButton oldWidget) {
    print('didUpdateWidget');
    print(widget.btnDisabled);
    print(widget.btnText);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.btnDisabled
        ? Container(color: Colors.grey)
        : GestureDetector(
            key: const ValueKey(1),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amberAccent, Colors.lightBlue, Colors.red],
                ),
              ),
            ),
            onTap: () async {},
          );
  }
}
