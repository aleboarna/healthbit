import 'package:flutter/material.dart';
import 'package:healthbit/web/patient_model.dart';

class AddPatientForm extends StatelessWidget {
  final Function onAddNewPatient;
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

  AddPatientForm({required this.onAddNewPatient});

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
                  padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Adaugare pacient nou',
                        style: TextStyle(color: Colors.black45, fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 30.0,
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                            'CNP: ',
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
                                identityNumber = value;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                          onAddNewPatient(PatientModel(
                              name: name ?? '',
                              age: age ?? '',
                              identityNumber: identityNumber ?? '',
                              adress: adress ?? '',
                              phoneNumber: phoneNumber ?? '',
                              email: email ?? '',
                              job: job ?? '',
                              workPlace: workPlace ?? '',
                              medicalHistory: medicalHistory ?? '',
                              alergies: alergies ?? '',
                              cardioConsults: cardioConsults ?? ''));
                        },
                        child: const Text(
                          'Adaugare',
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
