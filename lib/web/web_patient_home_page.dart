import 'package:flutter/material.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/temperature.dart';
import 'package:healthbit/utils/alert_entry_widget.dart';
import 'package:healthbit/utils/flow_chart.dart';
import 'package:healthbit/web/patient_model.dart';

import 'activity_entry_widget.dart';

class WebPatientHomePage extends StatefulWidget {
  List<Alert> alertsList;
  List<ActivitiesToDo> activityList;
  PatientModel? patient;
  Function logout;
  WebPatientHomePage(
      {required this.alertsList,
      required this.activityList,
      required this.logout,
      required this.patient});

  @override
  _WebPatientHomePageState createState() => _WebPatientHomePageState();
}

class _WebPatientHomePageState extends State<WebPatientHomePage> {
  Future<void> showMyDialog(PatientModel? patient) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(children: [
          DataTable(columns: [
            DataColumn(label: Text('Vizualizare date')),
            DataColumn(label: Text('')),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('Nume:')),
              DataCell(Text(patient!.name))
            ]),
            DataRow(cells: [
              DataCell(Text('Varsta:')),
              DataCell(Text(patient.age))
            ]),
            DataRow(cells: [
              DataCell(Text('CNP:')),
              DataCell(Text(patient.identityNumber))
            ]),
            DataRow(cells: [
              DataCell(Text('Adresa:')),
              DataCell(Text(patient.adress))
            ]),
            DataRow(cells: [
              DataCell(Text('Numar de telefon:')),
              DataCell(Text(patient.phoneNumber))
            ]),
            DataRow(cells: [
              DataCell(Text('Email:')),
              DataCell(Text(patient.email))
            ]),
            DataRow(cells: [
              DataCell(Text('Profesie:')),
              DataCell(Text(patient.job))
            ]),
            DataRow(cells: [
              DataCell(Text('Loc de munca:')),
              DataCell(Text(patient.workPlace))
            ]),
            DataRow(cells: [
              DataCell(Text('Istoric medical:')),
              DataCell(Text(patient.medicalHistory))
            ]),
            DataRow(cells: [
              DataCell(Text('Alergii:')),
              DataCell(Text(patient.alergies))
            ]),
            DataRow(cells: [
              DataCell(Text('Consulturi cardiologice:')),
              DataCell(Text(patient.cardioConsults))
            ])
          ])
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff264b89),
          title: Text(
            'HealthBit',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x80c5dbff),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date personale',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showMyDialog(widget.patient);
                              },
                              icon: Icon(Icons.file_copy)),
                          IconButton(
                              onPressed: () {
                                widget.logout();
                              },
                              icon: Icon(Icons.logout)),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: LineChartMedical(
                        measuredIndex: 'Puls',
                        listOfValues: [
                          Pulse(pulse: 75, dateTime: DateTime(2021, 05, 12)),
                          Pulse(pulse: 77, dateTime: DateTime(2021, 05, 13)),
                          Pulse(pulse: 72, dateTime: DateTime(2021, 05, 14)),
                          Pulse(pulse: 73, dateTime: DateTime(2021, 05, 15)),
                          Pulse(pulse: 75, dateTime: DateTime(2021, 05, 16)),
                          Pulse(pulse: 77, dateTime: DateTime(2021, 05, 17)),
                          Pulse(pulse: 75, dateTime: DateTime(2021, 05, 18)),
                          Pulse(pulse: 73, dateTime: DateTime(2021, 05, 19)),
                          Pulse(pulse: 74, dateTime: DateTime(2021, 05, 20)),
                          Pulse(pulse: 77, dateTime: DateTime(2021, 05, 21)),
                        ],
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
                              temperature: 23),
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
                              temperature: 19),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: LineChartMedical(
                        measuredIndex: 'Umiditate',
                        listOfValues: [
                          Humidity(
                              dateTime: DateTime(2021, 05, 12), humidity: 46),
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
                      height: MediaQuery.of(context).size.height / 2.9,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Alarme',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
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
                      height: MediaQuery.of(context).size.height / 2.9,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Calendar',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          SizedBox(height: 20.0),
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
}
