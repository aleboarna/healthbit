import 'package:flutter/material.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/web/add_patient_form.dart';
import 'package:healthbit/web/patient_model.dart';
import 'package:healthbit/web/web_edit_patient.dart';
import 'package:healthbit/web/web_patient_medical_page.dart';

class WebHomePage extends StatefulWidget {
  Function onAddNewPatient;
  Function onEditPatient;
  Function onDeletePatient;
  Map<String, PatientModel> allPatients;
  List<Alert> alertsList;
  Function newActivityToDo;
  List<ActivitiesToDo> activityList;
  Function logout;

  WebHomePage(
      {required this.onAddNewPatient,
      required this.onEditPatient,
      required this.allPatients,
      required this.onDeletePatient,
      required this.alertsList,
      required this.logout,
      required this.activityList,
      required this.newActivityToDo});

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  //TODO: identitynumber
  Future<void> showMyDialog(String identityNumber) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Sigur doriti sa stergeti acest pacient?',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Da',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                widget.onDeletePatient(identityNumber);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Nu',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showmyECG() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(children: [Image.asset('/ECG.jpg')]);
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
                        'Pacienti',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder: (BuildContext buildContext,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return AddPatientForm(
                                        onAddNewPatient:
                                            widget.onAddNewPatient);
                                  },
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                );
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                widget.logout();
                              },
                              icon: Icon(Icons.logout))
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                DataTable(
                  columnSpacing: 150.0,
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Nume')),
                    DataColumn(label: Text('Varsta')),
                    DataColumn(label: Text('APP')),
                    DataColumn(label: Text('Alergii')),
                    DataColumn(label: Text('Cardio')),
                    DataColumn(label: Text('Editeaza')),
                    DataColumn(label: Text('Sterge')),
                    DataColumn(label: Text('Vizualizeaza')),
                    DataColumn(label: Text('EKG')),
                  ],
                  rows: getRows(widget.allPatients),
                ),
                // Column(
                //   children: getAllPatients(widget.allPatients),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> getRows(Map<String, PatientModel> allPatientsMap) {
    List<DataRow> list = List.empty(growable: true);
    List<PatientModel> allPatientsList = List.empty(growable: true);
    allPatientsList = allPatientsMap.values.toList();
    for (int i = 0; i < allPatientsList.length; i++) {
      list.add(DataRow(cells: <DataCell>[
        DataCell(Text(allPatientsList[i].name)),
        DataCell(Text(allPatientsList[i].age)),
        DataCell(Text(allPatientsList[i].medicalHistory)),
        DataCell(Text(allPatientsList[i].alergies)),
        DataCell(Text(allPatientsList[i].cardioConsults)),
        DataCell(
          IconButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (BuildContext buildContext,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return WebEditPatient(
                      onEditNewPatient: widget.onEditPatient,
                      currentPatientDetails: allPatientsList[i],
                    );
                  },
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                );
              },
              icon: Icon(Icons.build_rounded)),
        ),
        DataCell(
          IconButton(
              onPressed: () {
                setState(() {
                  showMyDialog(allPatientsList[i].identityNumber);
                });
              },
              icon: Icon(Icons.delete)),
        ),
        DataCell(IconButton(
            onPressed: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (BuildContext buildContext,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return WebPatientMedicalPage(
                    alertsList: widget.alertsList,
                    activityList: widget.activityList,
                    newActivityToDo: widget.newActivityToDo,
                  );
                },
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
              );
            },
            icon: Icon(Icons.search))),
        DataCell(
          IconButton(
              onPressed: () {
                setState(() {
                  showmyECG();
                });
              },
              icon: Icon(Icons.add_circle_sharp)),
        ),
      ]));
    }
    return list;
  }
}
