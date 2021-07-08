import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/store/LoginAction.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/web_login_page.dart';

class WebLoginPageConnector extends StatelessWidget {
  static const String id = 'web_login_page_connector';

  const WebLoginPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WebLoginPageViewModel>(
      model: WebLoginPageViewModel(),
      builder: (BuildContext context, WebLoginPageViewModel vm) => WebLoginPage(
        onLogin: vm.onLogin,
      ),
    );
  }
}

class WebLoginPageViewModel extends BaseModel<AppState> {
  WebLoginPageViewModel();

  late Function onLogin;

  WebLoginPageViewModel.build({required this.onLogin});

  @override
  WebLoginPageViewModel fromStore() => WebLoginPageViewModel.build(
        onLogin: (String email) => dispatch!(WebLoginAction(email: email)),
      );
}
