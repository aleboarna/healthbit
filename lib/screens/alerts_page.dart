import 'package:flutter/material.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/utils/alert_entry_widget.dart';

class AlertsPage extends StatelessWidget {
  List<Alert>? alertsList;

  AlertsPage({this.alertsList});

  List<AlertEntryWidget> buildEntries(List<Alert> list) {
    List<AlertEntryWidget> result = List.empty(growable: true);
    for (Alert item in list) {
      result.add(AlertEntryWidget(
        alertCategory: item.category,
        alertDetails: item.details,
        alertTime: item.dateTime,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff02235b),
        title: Text(
          'Alerte',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          reverse: false,
          children: buildEntries(alertsList!),
        ),
      ),
    );
  }
}
