import 'package:mobx/mobx.dart';
enum AppState { initial, inProgress, success, failure }


mixin StateMixin<T> on Store {
  @observable
  AppState _status = AppState.initial;

  @computed
  AppState get status => _status;

  @action
  Future<void> setState(AppState newStatus) async {
    _status = newStatus;
  }
}