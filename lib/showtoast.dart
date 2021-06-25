import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class showtoast extends StatefulWidget {
  @override
  _showtoastState createState() {
    return _showtoastState();
  }
}

class _showtoastState extends State<showtoast> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Notification Example',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Toast Notification Example'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: RaisedButton(
                child: Text('click to show'),
                onPressed: (){
                  Toast.show(
                      "Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                }
              ),
            ),
          )
      ),
    );
  }
}

void main() => runApp(showtoast());