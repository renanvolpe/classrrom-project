// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_connectivity.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InternetConnectivity on InternetConnectivityBase, Store {
  Computed<bool>? _$hasConnectionComputed;

  @override
  bool get hasConnection =>
      (_$hasConnectionComputed ??= Computed<bool>(() => super.hasConnection,
              name: 'InternetConnectivityBase.hasConnection'))
          .value;

  late final _$isConnectedAtom =
      Atom(name: 'InternetConnectivityBase.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('InternetConnectivityBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$InternetConnectivityBaseActionController =
      ActionController(name: 'InternetConnectivityBase', context: context);

  @override
  void isInternetConnected(ConnectivityResult? result) {
    final _$actionInfo = _$InternetConnectivityBaseActionController.startAction(
        name: 'InternetConnectivityBase.isInternetConnected');
    try {
      return super.isInternetConnected(result);
    } finally {
      _$InternetConnectivityBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected},
hasConnection: ${hasConnection}
    ''';
  }
}
