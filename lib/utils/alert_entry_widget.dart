import 'package:flutter/material.dart';

class AlertEntryWidget extends StatelessWidget {
  String? alertCategory;
  String? alertDetails;
  DateTime? alertTime;

  AlertEntryWidget({this.alertCategory, this.alertDetails, this.alertTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff02235b)),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Alerta! ' + alertCategory! + '\n' + alertDetails!,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              alertTime.toString().substring(0, 19),
              style: TextStyle(fontSize: 10.0),
            )
          ],
        ),
      ),
    );
  }
}
