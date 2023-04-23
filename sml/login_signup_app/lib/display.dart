import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CounterDisplay extends StatefulWidget {
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  _CounterDisplayState createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  // late DatabaseReference _counterRef;
  // String _counterValue = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _counterRef = FirebaseDatabase.instanceFor(
  //       app: Firebase.app('nodemcudata-55ffc'),
  //       databaseURL:
  //           'https://nodemcudata-55ffc-default-rtdb.firebaseio.com/')
  //       .ref('VisitorInside')
  //       // .child('VisitorInside')
  //       .child('counter');
  //   _counterRef.onValue.listen((event) {
  //     setState(() {
  //       _counterValue = event.snapshot.value.toString();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Display'),
      ),
      body: Center(
        child: Text(
          'Visitor Count: 3',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
