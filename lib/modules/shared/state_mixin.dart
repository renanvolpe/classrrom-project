import 'package:mobx/mobx.dart';

enum AppState { initial, inProgress, success, failure }

abstract class IApiCall {
  @observable
  AppState status = AppState.initial;

  @computed
  AppState get state => status;

  @observable
  String? errorMessage;

  @action
  void setState(AppState newStatus) {
    status = newStatus;
  }
}
