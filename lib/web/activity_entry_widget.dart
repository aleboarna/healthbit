import 'package:flutter/material.dart';

class ActivityEntryWidget extends StatelessWidget {
  String details;
  DateTime time;
  Color color;

  ActivityEntryWidget(
      {required this.details, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              details,
              style: TextStyle(fontSize: 20.0, color: color),
            ),
            Text(
              time.toString().substring(0, 10),
              style: TextStyle(fontSize: 10.0, color: color),
            )
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
// import 'package:healthbit/models/activitiesToDo.dart';
// import 'package:healthbit/models/alert.dart';
// import 'package:healthbit/web/add_patient_form.dart';
// import 'package:healthbit/web/patient_model.dart';
// import 'package:healthbit/web/web_edit_patient.dart';
// import 'package:healthbit/web/web_patient_medical_page.dart';
//
// class WebHomePage extends StatefulWidget {
//   Function onAddNewPatient;
//   Function onEditPatient;
//   Function onDeletePatient;
//   Map<String, PatientModel> allPatients;
//   List<Alert> alertsList;
//   Function newActivityToDo;
//   List<ActivitiesToDo> activityList;
//
//   WebHomePage(
//       {required this.onAddNewPatient,
//       required this.onEditPatient,
//       required this.allPatients,
//       required this.onDeletePatient,
//       required this.alertsList,
//       required this.activityList,
//       required this.newActivityToDo});
//
//   @override
//   _WebHomePageState createState() => _WebHomePageState();
// }
//
// class _WebHomePageState extends State<WebHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xff264b89),
//           title: Text(
//             'HealthBit',
//             style: TextStyle(color: Colors.white),
//           ),
//           centerTitle: true,
//         ),
//         body: Container(
//           padding: EdgeInsets.all(30.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color(0x80c5dbff),
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Pacienti',
//                         style: TextStyle(fontSize: 20.0),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             showGeneralDialog(
//                               context: context,
//                               pageBuilder: (BuildContext buildContext,
//                                   Animation<double> animation,
//                                   Animation<double> secondaryAnimation) {
//                                 return AddPatientForm(
//                                     onAddNewPatient: widget.onAddNewPatient);
//                               },
//                               barrierDismissible: true,
//                               barrierLabel: MaterialLocalizations.of(context)
//                                   .modalBarrierDismissLabel,
//                             );
//                           },
//                           icon: Icon(Icons.add))
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 Column(
//                   children: getAllPatients(widget.allPatients),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<PatientItemHomePage> getAllPatients(
//       Map<String, PatientModel> allPatientsMap) {
//     List<PatientItemHomePage> list = List.empty(growable: true);
//     List<PatientModel> allPatientsList = List.empty(growable: true);
//     allPatientsList = allPatientsMap.values.toList();
//     for (int i = 0; i < allPatientsList.length; i++) {
//       list.add(PatientItemHomePage(
//         newActivityToDo: widget.newActivityToDo,
//         patient: allPatientsList[i],
//         deletePatient: widget.onDeletePatient,
//         editPatient: widget.onEditPatient,
//         context: context,
//         alertsList: widget.alertsList,
//         activityList: widget.activityList,
//       ));
//     }
//     return list;
//   }
// }
//
// class PatientItemHomePage extends StatefulWidget {
//   PatientModel patient;
//   Function deletePatient;
//   Function editPatient;
//   Function newActivityToDo;
//   dynamic context;
//   List<Alert> alertsList;
//   List<ActivitiesToDo> activityList;
//
//   PatientItemHomePage(
//       {required this.patient,
//       required this.deletePatient,
//       required this.editPatient,
//       required this.context,
//       required this.alertsList,
//       required this.activityList,
//       required this.newActivityToDo});
//
//   @override
//   _PatientItemHomePageState createState() => _PatientItemHomePageState();
// }
//
// class _PatientItemHomePageState extends State<PatientItemHomePage> {
//   Future<void> showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(
//                   'Sigur doriti sa stergeti acest pacient?',
//                   style: TextStyle(fontSize: 30.0),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text(
//                 'Da',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               onPressed: () {
//                 widget.deletePatient(widget.patient.identityNumber);
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text(
//                 'Nu',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text(
//             widget.patient!.name!,
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           Text(
//             widget.patient!.age!,
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           Text(
//             widget.patient!.medicalHistory!,
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           Text(
//             widget.patient!.alergies!,
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           Text(
//             widget.patient!.cardioConsults!,
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 showGeneralDialog(
//                   context: context,
//                   pageBuilder: (BuildContext buildContext,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation) {
//                     return WebEditPatient(
//                       onEditNewPatient: widget.editPatient,
//                       currentPatientDetails: widget.patient,
//                     );
//                   },
//                   barrierDismissible: true,
//                   barrierLabel: MaterialLocalizations.of(context)
//                       .modalBarrierDismissLabel,
//                 );
//               },
//               icon: Icon(Icons.build_rounded)),
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   showMyDialog();
//                 });
//               },
//               icon: Icon(Icons.delete)),
//           IconButton(
//               onPressed: () {
//                 showGeneralDialog(
//                   context: context,
//                   pageBuilder: (BuildContext buildContext,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation) {
//                     return WebPatientMedicalPage(
//                       alertsList: widget.alertsList,
//                       activityList: widget.activityList,
//                       newActivityToDo: widget.newActivityToDo,
//                     );
//                   },
//                   barrierDismissible: true,
//                   barrierLabel: MaterialLocalizations.of(context)
//                       .modalBarrierDismissLabel,
//                 );
//               },
//               icon: Icon(Icons.search)),
//         ],
//       ),
//     );
//   }
// }
