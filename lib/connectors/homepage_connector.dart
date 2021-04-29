import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/screens/homepage.dart';
import 'package:healthbit/store/app_state.dart';

class HomePageConnector extends StatelessWidget {
  static const String id = 'home_page_connector';

  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      model: HomePageViewModel(),
      builder: (BuildContext context, HomePageViewModel vm) => HomePage(),
    );
  }
}

class HomePageViewModel extends BaseModel<AppState> {
  HomePageViewModel();

  HomePageViewModel.build();

  @override
  HomePageViewModel fromStore() => HomePageViewModel.build();
}
