import 'package:flutter/material.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/recommendation.dart';
import 'package:healthbit/models/temperature.dart';
import 'package:healthbit/utils/flow_chart.dart';

class MedicalFilePage extends StatelessWidget {
  String? username;
  DateTime? birthDate;
  List<String>? clinicalHistory;
  List<Recommendation>? recommendations;
  List<Pulse>? pulse;
  List<Temperature>? temperature;
  List<Humidity>? humidity;

  MedicalFilePage(
      {this.username,
      this.birthDate,
      this.clinicalHistory,
      this.recommendations,
      this.pulse,
      this.temperature,
      this.humidity});

  String listAllClinicalHistory(List<String> list) {
    String result = '';
    for (String item in list) {
      result += '\n' + item;
    }
    return result;
  }

  String listAllRecommendations(List<Recommendation> list) {
    String result = '';
    for (Recommendation item in list) {
      result += '\n' + item.details;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle_rounded)),
              Tab(icon: Icon(Icons.filter_frames)),
            ],
          ),
          title: Text(
            'Fisa mea medicala',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff02235b),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Color(0xff02235b))),
                        child: Text('Nume si prenume:\n' + username!)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Color(0xff02235b))),
                        child: Text('Data nasterii:\n' +
                            birthDate.toString().substring(0, 10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Color(0xff02235b))),
                        child: Text('Antecedente personale patologice:' +
                            listAllClinicalHistory(clinicalHistory!))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Color(0xff02235b))),
                        child: Text('Recomandari:' +
                            listAllRecommendations(recommendations!))),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.05,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              LineChartMedical(
                                  measuredIndex: 'Puls', listOfValues: pulse),
                              SizedBox(
                                height: 15.0,
                              ),
                              LineChartMedical(
                                  measuredIndex: 'Temperatura',
                                  listOfValues: temperature),
                              SizedBox(
                                height: 15.0,
                              ),
                              LineChartMedical(
                                  measuredIndex: 'Umiditate',
                                  listOfValues: humidity),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
