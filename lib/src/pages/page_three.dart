import 'package:demo_logging/src/errors.dart';
import 'package:flutter/material.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:_pageText(),        backgroundColor: Colors.blue,
      ),
        body: Column(
          children: [
            _pageText(),

            RaisedButton(
                child: Text('1'),
                color: Colors.red,
                onPressed: ()=> Navigator.pushNamed(context, '/')),
            RaisedButton(
                child: Text('2'),
                color: Colors.green,
                onPressed: () => Navigator.pushNamed(context, '/two')),
            RaisedButton(
                child: Text('4'),
                color: Colors.yellow,
                onPressed: () => Navigator.pushNamed(context, '/four')),
            RaisedButton(
                child: Text('5'),
                color: Colors.orange,
                onPressed: () => Navigator.pushNamed(context, '/five')),
            RaisedButton(
                child: Text('6'),
                color: Colors.purple,
                onPressed: () => Navigator.pushNamed(context, '/six')),
            RaisedButton(
                child: Text('bad', style: TextStyle(color: Colors.white),),
                color: Colors.black,
                onPressed: () => Navigator.pushNamed(context, 'bad')),
            RaisedButton(
                child: Text('dart exception', style: TextStyle(color:
                Colors.white)),
                color: Colors.black,
                onPressed: () async => await throwDartException()),
            RaisedButton(
                child: Text('plugin exception', style: TextStyle(color:
                Colors.white)),
                color: Colors.black,
                onPressed: () async => await throwPluginException())
          ],
        ));
  }


  Widget _pageText() => Text('Page Three');
}
