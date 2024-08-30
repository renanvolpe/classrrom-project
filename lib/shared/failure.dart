import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List<Object> props = const []]);
}

class ServerFailure extends Failure {
  final String message = "Server in Error, wait for a moment";

  const ServerFailure([String? message]);

  @override
  List<Object> get props => [message]; 

}

class NetworkFailure extends Failure {
  final String message;

  const NetworkFailure(this.message);

  @override
  List<Object> get props => [message]; 

}

class UnexpectedFailure extends Failure {
  final String message;

  const UnexpectedFailure(this.message);

  @override
  List<Object> get props => [message];
}