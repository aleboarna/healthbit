import 'package:flutter/material.dart';
import 'package:healthbit/connectors/alerts_page_connector.dart';
import 'package:healthbit/connectors/calendar_page_connector.dart';
import 'package:healthbit/connectors/homepage_connector.dart';
import 'package:healthbit/connectors/login_page_connector.dart';
import 'package:healthbit/connectors/medical_file_page_connector.dart';
import 'package:healthbit/utils/drawer_list_item.dart';

class SideDrawer extends StatelessWidget {
  String? userName;
  SideDrawer({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(15.0)),
      ),
      width: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff02235b),
                  ),
                  height: 180.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Theme.of(context).primaryColor,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${userName![0].toUpperCase()}${userName!.substring(1)}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DrawerListItem(
              title: 'Acasa',
              icon: Icons.home,
              onTap: () {
                Navigator.pushNamed(context, HomePageConnector.id);
              },
            ),
            DrawerListItem(
              title: 'Fisa medicala',
              icon: Icons.filter_frames,
              onTap: () {
                Navigator.pushNamed(context, MedicalFilePageConnector.id);
              },
            ),
            DrawerListItem(
              title: 'Alarme',
              icon: Icons.notifications,
              onTap: () {
                Navigator.pushNamed(context, AlertsPageConnector.id);
              },
            ),
            DrawerListItem(
              title: 'Calendar',
              icon: Icons.calendar_today,
              onTap: () {
                Navigator.pushNamed(context, CalendarPageConnector.id);
              },
            ),
            DrawerListItem(
              title: 'Delogare',
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamed(context, LoginPageConnector.id);
              },
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: [
                Text('Brought to you by',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff02235b),
                        fontStyle: FontStyle.italic)),
                Container(
                  width: 120.0,
                  height: 120.0,
                  child: Image(
                    image: AssetImage('assets/id_solutions.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
