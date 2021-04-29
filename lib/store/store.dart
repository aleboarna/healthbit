import 'package:async_redux/async_redux.dart';
import 'package:healthbit/store/app_state.dart';

// ignore: avoid_classes_with_only_static_members
class ReduxStore {
  static final _store = _getStore();

  static Store<AppState> get store => _store;

  static Store<AppState> _getStore() {
    return Store<AppState>(
      initialState: AppState.initialState(),
    );
  }
}
