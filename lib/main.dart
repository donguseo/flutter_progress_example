import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProgressExample(title: 'Progress Example'),
    );
  }
}

class ProgressExample extends StatefulWidget {
  ProgressExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProgressExampleState createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  bool _isDialogVisible = false;

  void _showDialog() {
    setState(() {
      _isDialogVisible = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isDialogVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Content',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _showDialog,
            tooltip: 'Send',
            child: Icon(Icons.send),
          ),
        ),
        Visibility(
            visible: _isDialogVisible,
            child: Container(
              color: Colors.black26,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(),
              ),
            ))
      ],
    );
  }
}
