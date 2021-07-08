import 'package:flutter/material.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/temperature.dart';
import 'package:healthbit/utils/alert_entry_widget.dart';
import 'package:healthbit/utils/flow_chart.dart';
import 'package:healthbit/web/activity_entry_widget.dart';

class WebPatientMedicalPage extends StatefulWidget {
  List<Alert> alertsList;
  List<ActivitiesToDo> activityList;
  Function newActivityToDo;
  WebPatientMedicalPage(
      {required this.alertsList,
      required this.activityList,
      required this.newActivityToDo});

  @override
  _WebPatientMedicalPageState createState() => _WebPatientMedicalPageState();
}

class _WebPatientMedicalPageState extends State<WebPatientMedicalPage> {
  DateTime selectedDate = DateTime.now();
  String activityToDo = '';

  double minValuePulse = 50;
  double maxValuePulse = 140;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (BuildContext buildContext,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return SimpleDialog(
                                children: [
                                  MinMaxSlider(
                                      valuePulse: 50,
                                      minSlider: 30,
                                      maxSlider: 90),
                                  MinMaxSlider(
                                      valuePulse: 140,
                                      minSlider: 120,
                                      maxSlider: 190),
                                ],
                              );
                            },
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: LineChartMedical(
                            measuredIndex: 'Puls',
                            listOfValues: [
                              Pulse(
                                  pulse: 75, dateTime: DateTime(2021, 05, 12)),
                              Pulse(
                                  pulse: 77, dateTime: DateTime(2021, 05, 13)),
                              Pulse(
                                  pulse: 72, dateTime: DateTime(2021, 05, 14)),
                              Pulse(
                                  pulse: 73, dateTime: DateTime(2021, 05, 15)),
                              Pulse(
                                  pulse: 75, dateTime: DateTime(2021, 05, 16)),
                              Pulse(
                                  pulse: 77, dateTime: DateTime(2021, 05, 17)),
                              Pulse(
                                  pulse: 75, dateTime: DateTime(2021, 05, 18)),
                              Pulse(
                                  pulse: 73, dateTime: DateTime(2021, 05, 19)),
                              Pulse(
                                  pulse: 74, dateTime: DateTime(2021, 05, 20)),
                              Pulse(
                                  pulse: 77, dateTime: DateTime(2021, 05, 21)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: LineChartMedical(
                          measuredIndex: 'Temperatura',
                          listOfValues: [
                            Temperature(
                                dateTime: DateTime(2021, 05, 12),
                                temperature: 20),
                            Temperature(
                                dateTime: DateTime(2021, 05, 13),
                                temperature: 21),
                            Temperature(
                                dateTime: DateTime(2021, 05, 14),
                                temperature: 20),
                            Temperature(
                                dateTime: DateTime(2021, 05, 15),
                                temperature: 22),
                            Temperature(
                                dateTime: DateTime(2021, 05, 16),
                                temperature: 21),
                            Temperature(
                                dateTime: DateTime(2021, 05, 17),
                                temperature: 22),
                            Temperature(
                                dateTime: DateTime(2021, 05, 18),
                                temperature: 22),
                            Temperature(
                                dateTime: DateTime(2021, 05, 19),
                                temperature: 22),
                            Temperature(
                                dateTime: DateTime(2021, 05, 20),
                                temperature: 21),
                            Temperature(
                                dateTime: DateTime(2021, 05, 21),
                                temperature: 22),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: LineChartMedical(
                          measuredIndex: 'Umiditate',
                          listOfValues: [
                            Humidity(
                                dateTime: DateTime(2021, 05, 12), humidity: 54),
                            Humidity(
                                dateTime: DateTime(2021, 05, 13), humidity: 52),
                            Humidity(
                                dateTime: DateTime(2021, 05, 14), humidity: 49),
                            Humidity(
                                dateTime: DateTime(2021, 05, 15), humidity: 51),
                            Humidity(
                                dateTime: DateTime(2021, 05, 16), humidity: 53),
                            Humidity(
                                dateTime: DateTime(2021, 05, 17), humidity: 47),
                            Humidity(
                                dateTime: DateTime(2021, 05, 18), humidity: 52),
                            Humidity(
                                dateTime: DateTime(2021, 05, 19), humidity: 60),
                            Humidity(
                                dateTime: DateTime(2021, 05, 20), humidity: 52),
                            Humidity(
                                dateTime: DateTime(2021, 05, 21), humidity: 49),
                            Humidity(
                                dateTime: DateTime(2021, 05, 21), humidity: 52),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2c274c),
                            borderRadius: BorderRadius.circular(20.0)),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Alarme',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 200.0,
                              child: ListView(
                                reverse: false,
                                children: buildEntries(widget.alertsList),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2c274c),
                            borderRadius: BorderRadius.circular(20.0)),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Calendar de activitati',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    onChanged: (value) {
                                      activityToDo = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 14.0, color: Colors.white),
                                      hintText:
                                          'Scrieti aici activitatea dorita',
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => _selectDate(context),
                                  child: Icon(Icons.calendar_today),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.newActivityToDo(
                                          details: activityToDo,
                                          date: selectedDate);
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 200.0,
                              child: ListView(
                                reverse: false,
                                children: buildEntries(widget.activityList),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildEntries(List<dynamic> list) {
    List<Widget> result = List.empty(growable: true);
    if (list is List<Alert>) {
      for (Alert item in list) {
        result.add(AlertEntryWidget(
            alertCategory: item.category,
            alertDetails: item.details,
            alertTime: item.dateTime,
            color: Colors.white));
      }
    } else if (list is List<ActivitiesToDo>) {
      for (ActivitiesToDo item in list) {
        result.add(ActivityEntryWidget(
            details: item.activity, time: item.timeToDo, color: Colors.white));
      }
    }
    return result;
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Ce valori permise doriti sa setati pentru acest pacient?',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Text('Valoare minima:'),
                Slider(
                    value: minValuePulse,
                    min: 30,
                    max: 80,
                    divisions: 5,
                    label: minValuePulse.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        minValuePulse = value;
                      });
                    })
              ],
            ),
            Column(
              children: [
                Text('Valoare maxima:'),
                Slider(
                    value: maxValuePulse,
                    min: 80,
                    max: 200,
                    divisions: 5,
                    label: maxValuePulse.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        maxValuePulse = value;
                      });
                    })
              ],
            ),
          ],
        );
      },
    );
  }
}

class MinMaxSlider extends StatefulWidget {
  double valuePulse;
  double minSlider;
  double maxSlider;

  MinMaxSlider(
      {required this.valuePulse,
      required this.minSlider,
      required this.maxSlider});

  @override
  _MinMaxSliderState createState() => _MinMaxSliderState();
}

class _MinMaxSliderState extends State<MinMaxSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Valoare minima:'),
          Slider(
              value: widget.valuePulse,
              min: widget.minSlider,
              max: widget.maxSlider,
              divisions: 5,
              label: widget.valuePulse.round().toString(),
              onChanged: (double value) {
                setState(() {
                  widget.valuePulse = value;
                });
              })
        ],
      ),
    );
  }
}
