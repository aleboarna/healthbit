import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/screens/login_page.dart';
import 'package:healthbit/store/MobileLoginAction.dart';
import 'package:healthbit/store/app_state.dart';

class LoginPageConnector extends StatelessWidget {
  static const String id = 'login_page_connector';

  const LoginPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageViewModel>(
      model: LoginPageViewModel(),
      builder: (BuildContext context, LoginPageViewModel vm) => LoginPage(
        onLogin: vm.onLogin,
      ),
    );
  }
}

class LoginPageViewModel extends BaseModel<AppState> {
  LoginPageViewModel();
  late Function onLogin;
  LoginPageViewModel.build({required this.onLogin});

  @override
  LoginPageViewModel fromStore() => LoginPageViewModel.build(
        onLogin: () => dispatch!(MobileLoginAction()),
      );
}
