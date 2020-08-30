import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hello_world/home-page/home-page.dart';

class HomePageState extends State<HomePage> {
  List<String> _timestamps = [];

  void _incrementCounter() {
    setState(() {
      _timestamps.insert(0, new DateTime.now().toIso8601String());
    });
  }

  _helloWorldText() {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: RichText(
        text: TextSpan(
          text: 'HELLO WORLD',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      height: 100,
      margin: const EdgeInsets.all(25),
    );
  }

  _timestampsView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              int module = index % 10 + 1;
              int bkgColor = 0 + (module * 10);
              int txtColor = 255 - (module * 10);
              return Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(bkgColor, bkgColor, bkgColor, 1),
                child: RichText(
                  text: TextSpan(
                    text: (index == 0
                            ? '>> '
                            : ((_timestamps.length - index).toString() +
                                ': ')) +
                        _timestamps[index] +
                        (index == 0 ? ' <<' : ''),
                    style: TextStyle(
                      color: Color.fromRGBO(txtColor, txtColor, txtColor, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
            childCount: _timestamps.length,
          ),
        ),
      ],
    );
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
      backgroundColor: Colors.grey,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _helloWorldText(),
            Text(
              'Time Marks:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Expanded(
              child: _timestampsView(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Current Date',
        child: Icon(Icons.timer),
        backgroundColor: Colors.red,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
