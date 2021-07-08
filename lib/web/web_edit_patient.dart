import 'package:flutter/material.dart';
import 'package:healthbit/web/patient_model.dart';

class WebEditPatient extends StatelessWidget {
  final Function onEditNewPatient;
  final PatientModel currentPatientDetails;
  String? name;
  String? age;
  String? identityNumber;
  String? adress;
  String? phoneNumber;
  String? email;
  String? job;
  String? workPlace;
  String? medicalHistory;
  String? alergies;
  String? cardioConsults;

  WebEditPatient(
      {required this.onEditNewPatient, required this.currentPatientDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 3,
        right: MediaQuery.of(context).size.width / 3,
        top: MediaQuery.of(context).size.height / 8,
        bottom: MediaQuery.of(context).size.height / 8,
      ),
      child: Center(
        child: Wrap(
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(40.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Schimbati campurile necesare',
                        style: TextStyle(color: Colors.black45, fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nume si prenume: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                name = value;
                              },
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.name,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Varsta: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                age = value;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.age,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adresa: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                adress = value;
                              },
                              keyboardType: TextInputType.streetAddress,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.adress,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Telefon: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                phoneNumber = value;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.phoneNumber,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.email,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profesie: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                job = value;
                              },
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.job,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Loc de munca: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                workPlace = value;
                              },
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.workPlace,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Istoric medical: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                medicalHistory = value;
                              },
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.medicalHistory,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alergii: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                alergies = value;
                              },
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.alergies,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Consultatii cardiologice: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                            child: TextField(
                              onChanged: (value) {
                                cardioConsults = value;
                              },
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: currentPatientDetails.cardioConsults,
                                hintStyle: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xbafd8383)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.only(left: 20.0, right: 20.0)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                        onPressed: () {
                          onEditNewPatient(PatientModel(
                            name: name ?? currentPatientDetails.name,
                            age: age ?? currentPatientDetails.age,
                            identityNumber:
                                currentPatientDetails.identityNumber,
                            adress: adress ?? currentPatientDetails.adress,
                            phoneNumber: phoneNumber ??
                                currentPatientDetails.phoneNumber,
                            email: email ?? currentPatientDetails.email,
                            job: job ?? currentPatientDetails.job,
                            workPlace:
                                workPlace ?? currentPatientDetails.workPlace,
                            medicalHistory: medicalHistory ??
                                currentPatientDetails.medicalHistory,
                            alergies:
                                alergies ?? currentPatientDetails.alergies,
                            cardioConsults: cardioConsults ??
                                currentPatientDetails.cardioConsults,
                          ));
                        },
                        child: const Text(
                          'Salveaza modificarile facute',
                          style: TextStyle(fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
