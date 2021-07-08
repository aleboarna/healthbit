import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/web_register_page.dart';

class WebRegisterPageConnector extends StatelessWidget {
  static const String id = 'web_register_page_connector';

  const WebRegisterPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WebRegisterPageViewModel>(
      model: WebRegisterPageViewModel(),
      builder: (BuildContext context, WebRegisterPageViewModel vm) =>
          WebRegisterPage(),
    );
  }
}

class WebRegisterPageViewModel extends BaseModel<AppState> {
  WebRegisterPageViewModel();

  WebRegisterPageViewModel.build();

  @override
  WebRegisterPageViewModel fromStore() => WebRegisterPageViewModel.build();
}
