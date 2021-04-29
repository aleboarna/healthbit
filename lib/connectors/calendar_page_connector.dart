import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/screens/calendar_page.dart';
import 'package:healthbit/store/app_state.dart';

class CalendarPageConnector extends StatelessWidget {
  static const String id = 'calendar_page_connector';

  const CalendarPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CalendarPageViewModel>(
      model: CalendarPageViewModel(),
      builder: (BuildContext context, CalendarPageViewModel vm) =>
          CalendarPage(),
    );
  }
}

class CalendarPageViewModel extends BaseModel<AppState> {
  CalendarPageViewModel();

  CalendarPageViewModel.build();

  @override
  CalendarPageViewModel fromStore() => CalendarPageViewModel.build();
}
