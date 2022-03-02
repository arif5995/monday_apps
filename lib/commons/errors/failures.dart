import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// General Failure
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class LokalFailure extends Failure {
  final String error;

  LokalFailure({required this.error});

  @override
  List<Object> get props => [error];
}
