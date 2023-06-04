// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_app/SignupPage.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CounterDisplay extends StatefulWidget {
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  _CounterDisplayState createState() => _CounterDisplayState();
}

class VisitorData {
  final DateTime time;
  final int count;

  VisitorData(this.time, this.count);
}

class _CounterDisplayState extends State<CounterDisplay> {
  late DatabaseReference _counterRef;
  List<VisitorData> _counterValue = [];
  String _visitorValue = '';
  @override
  void initState() {
    super.initState();
    _counterRef = FirebaseDatabase.instance.ref('VisitorInside/counter');
    _counterRef.onValue.listen((event) {
      setState(() {
        DateTime now = DateTime.now();
        int count = int.parse(event.snapshot.value.toString());
        _visitorValue = event.snapshot.value.toString();

        _counterValue.add(VisitorData(now, count));
        if (_counterValue.length > 6) {
          _counterValue.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Counter Display'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: _createLineChart(),
            ),
            Text(
              'Visitor Count: $_visitorValue',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLineChart() {
    List<charts.Series<VisitorData, DateTime>> seriesList = [
      charts.Series<VisitorData, DateTime>(
        id: 'Visitor Count',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (VisitorData data, _) => data.time,
        measureFn: (VisitorData data, _) => data.count,
        data: _counterValue,
      ),
    ];

    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          zeroBound: false,
          dataIsInWholeNumbers: true,
          desiredTickCount: 5,
        ),
      ),
      domainAxis: charts.DateTimeAxisSpec(
      tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
        minute: charts.TimeFormatterSpec(
          format: 'mm:ss',
          transitionFormat: 'mm:ss',
      ),
    ),),
    );
  }
}
