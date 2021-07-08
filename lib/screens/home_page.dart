import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/screens/side_drawer.dart';
import 'package:healthbit/utils/svg_getter.dart';

class HomePage extends StatefulWidget {
  int latestPulse;
  int latestHumidity;
  double latestTemp;
  bool ekg;
  String username;
  Function updatePulse;
  Function updateHumidity;
  Function updateTemp;
  Function updateAlerts;

  HomePage(
      {required this.latestPulse,
      required this.latestHumidity,
      required this.latestTemp,
      required this.ekg,
      required this.username,
      required this.updatePulse,
      required this.updateHumidity,
      required this.updateTemp,
      required this.updateAlerts});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _showMyDialog() async {
    int pulse = widget.latestPulse;
    String detalii = '';
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Pulsul tau este prea ridicat! $pulse'),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                  child: TextField(
                    onChanged: (value) {
                      detalii = value;
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Send message'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.updateAlerts(Alert(
                    category: 'Puls',
                    dateTime: DateTime.now(),
                    details: detalii + ' ($pulse)'));
              },
            ),
            TextButton(
              child: Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.updateAlerts(Alert(
                    category: 'Puls',
                    dateTime: DateTime.now(),
                    details: '$pulse'));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    // widget.startTracking();
    super.initState();
    var pulseStream = Stream<int>.periodic(Duration(seconds: 1), (x) => x);
    pulseStream.forEach((_) {
      widget.updatePulse();
      if (widget.latestPulse > 79) {
        setState(() {
          _showMyDialog();
        });
      }
      widget.updateHumidity();
      widget.updateTemp();
    });
    // pulseStream().listen((int newTick) {
    //   setState(() {
    //     widget.latestPulse = newTick;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff02235b),
        centerTitle: true,
        title: Text(
          "HealthBit",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawer: SideDrawer(
        userName: widget.username,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 2.5,
                child: SvgGetter(source: 'assets/logo1.svg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 7.0,
                        offset: Offset(-4, -3),
                      ),
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          offset: Offset(4, 5))
                    ],
                    color: Color(0xff02235b),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: PulseWidget(pulse: widget.latestPulse),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 7.0,
                        offset: Offset(-4, -3),
                      ),
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          offset: Offset(4, 5))
                    ],
                    color: Color(0xff02235b),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Umiditate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${widget.latestHumidity}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 7.0,
                        offset: Offset(-4, -3),
                      ),
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          offset: Offset(4, 5))
                    ],
                    color: Color(0xff02235b),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temperatura',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${widget.latestTemp.toStringAsFixed(1)}°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 7.0,
                        offset: Offset(-4, -3),
                      ),
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          offset: Offset(4, 5))
                    ],
                    color: Color(0xff02235b),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EKG',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.ekg! ? 'Normal' : 'Alerta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PulseWidget extends StatelessWidget {
  int pulse;

  PulseWidget({required this.pulse});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Puls',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '${pulse} bpm',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
