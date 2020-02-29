import 'package:flutter/material.dart';
import 'package:loading_indicator/loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Loading Indicator demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void _showLoadingIndicator() {
    print('isloading');
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 1000), () {      
      setState(() {
        _isLoading = false;
      });
      print(_isLoading);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Please click on the loading button to see loadingIndicator',
                        style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ],
                )
              ),
              Expanded(
                flex: 0,
                child: RaisedButton(
                  onPressed: _showLoadingIndicator,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF0D47A1)
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Loading Button',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: _isLoading ? Loader(loadingTxt: 'Content is loading...') : Container()
          )
        ],
      ),
    );
  }
}
