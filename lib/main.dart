import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/':(contex) => Tapper(title: 'Tapper'),

      },
    );
  }
}

class Tapper extends StatefulWidget {
  Tapper({Key key, this.title}) : super(key: key);

  final String title;

  //List<Color> c = [Colors.blueAccent,Colors.redAccent,Colors.greenAccent],

  @override
  _TapperState createState() => _TapperState();
}

class _TapperState extends State<Tapper> {
  int _counter = 0;
  int _flag = 0;
  get c => [Colors.blueAccent,Colors.redAccent,Colors.greenAccent];

  void _setBC()
  {
    setState(() {
      if (_counter > 0 ){ _flag = 0;}
      else if (_counter < 0 ){ _flag = 1;}
      else{_flag = 2;}
    });

  }
  void _incrementCounter() {

    setState(() {

      if (_counter == 99 || _counter == -99 ){ _resetCounter(); }
      ++_counter;
      _setBC();
    });
  }
  void _decrementCounter() {
    setState(() {

      if (_counter == 99 || _counter == -99 ){ _resetCounter(); }
      --_counter;
      _setBC();
    });
  }

  void _resetCounter() {
    setState(() {

      _counter = 0;
      _setBC();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text(widget.title),
      ),
      backgroundColor: c[_flag],
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              '$_counter',
              style: TextStyle(
                  color: Colors.white,
                fontSize: 250,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 50,),

          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Colors.black54,
            focusColor: Colors.amber,
            splashColor: Colors.white ,
            child: Icon(Icons.add),
          ),

          SizedBox(width: 50,),


          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            backgroundColor: Colors.black54,
            splashColor: Colors.white,
            child: Icon(Icons.restore),
          ),
          SizedBox(width: 50,),

          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decement',
            backgroundColor: Colors.black54,
            focusColor: Colors.amber,
            splashColor: Colors.white ,
            child: Icon(Icons.indeterminate_check_box_rounded),
          ),


        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
