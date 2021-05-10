import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/connectors/alerts_page_connector.dart';
import 'package:healthbit/connectors/calendar_page_connector.dart';
import 'package:healthbit/connectors/homepage_connector.dart';
import 'package:healthbit/connectors/login_page_connector.dart';
import 'package:healthbit/connectors/medical_file_page_connector.dart';
import 'package:healthbit/store/store.dart';

void main() {
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Redux route navigation
    NavigateAction.setNavigatorKey(navigatorKey);
    return StoreProvider(
      store: ReduxStore.store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        home: HomePageConnector(),
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: const Color(0xff02235b),
          iconTheme: const IconThemeData(
            color: Color(0xff02235b),
          ),
          textTheme: const TextTheme(
              headline6: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff566573),
              ),
              bodyText1: TextStyle(
                color: Color(0xff02235b),
                fontSize: 15.0,
              ),
              subtitle1: TextStyle(
                color: Color(0xff566573),
                fontSize: 20.0,
              )),
        ),
        routes: <String, WidgetBuilder>{
          HomePageConnector.id: (context) => const HomePageConnector(),
          LoginPageConnector.id: (context) => const LoginPageConnector(),
          CalendarPageConnector.id: (context) => const CalendarPageConnector(),
          AlertsPageConnector.id: (context) => const AlertsPageConnector(),
          MedicalFilePageConnector.id: (context) =>
              const MedicalFilePageConnector(),
        },
      ),
    );
  }
}
