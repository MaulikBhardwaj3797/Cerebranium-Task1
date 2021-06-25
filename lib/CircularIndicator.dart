import 'package:flutter/material.dart';


void main() => runApp(Cpi());

class Cpi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Circular Progress Indicator')),
            body: Center(
                child: CircularIndicator()
            )
        )
    );
  }
}

class CircularIndicator extends StatefulWidget {

  CircularIndicatorWidget createState() => CircularIndicatorWidget();

}

class CircularIndicatorWidget extends State {

  bool visible = true ;

  loadProgress(){

    if(visible == true){
      setState(() {
        visible = false;
      });
    }
    else{
      setState(() {
        visible = true;
      });
    }

  }
  bool new_visible = true ;

  load_Progress(){

    if(new_visible == true){
      setState(() {
        new_visible = false;
      });
    }
    else{
      setState(() {
        new_visible = true;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                  )
              ),

              RaisedButton(
                onPressed: loadProgress,
                color: Colors.pink,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(' Circular Indicator'),
              ),

              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: new_visible,
                  child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      child: Column(
                        children: [
                          LinearProgressIndicator(),
                        ],
                      )
                  )
              ),
              RaisedButton(
                onPressed: load_Progress,
                color: Colors.pink,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(' linear Indicator'),
              ),

            ],
          ),
        ));
  }}