import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class APIResultState<T> extends Equatable {
  final String? message;
  final T? result;

  const APIResultState({this.message, this.result});

  @override
  List<Object?> get props => [message, result];
}

class LoadingState<T> extends APIResultState<T> {
  const LoadingState({T? result}) : super(message: "Loading", result: result);

  @override
  List<Object?> get props => [result, message];
}

class NoInternetState<T> extends APIResultState<T> {
  const NoInternetState() : super(message: "No internet found");

  @override
  List<Object?> get props => [message];
}

class SuccessState<T> extends APIResultState<T> {
  const SuccessState(String? message, T? result) : super(message: message, result: result);

  @override
  List<Object?> get props => [message, result];
}

class FailureState<T> extends APIResultState<T> {
  const FailureState(String? message, {T? result}) : super(message: message, result: result);

  @override
  List<Object?> get props => [message, result];
}

class UserUnauthorisedState<T> extends APIResultState<T> {
  const UserUnauthorisedState() : super(message: "User unauthorized");

  @override
  List<Object?> get props => [message];
}

class TimeOutState<T> extends APIResultState<T> {
  const TimeOutState() : super(message: "Request timed out");

  @override
  List<Object?> get props => [message];
}

class UserDeletedState<T> extends APIResultState<T> {
  const UserDeletedState() : super(message: "User deleted");

  @override
  List<Object?> get props => [message];
}

class SessionExpiredState<T> extends APIResultState<T> {
  const SessionExpiredState({String? message = 'Session expired', T? result}) : super(message: message, result: result);

  @override
  List<Object?> get props => [message, result];
}

class APIResult {
  static bool isLoading(APIResultState? state) => state is LoadingState;

  static bool isSuccess(APIResultState? state) => state is SuccessState;
  
  static bool isFailure(APIResultState? state) => state is FailureState;
  
  static bool isNoInternet(APIResultState? state) => state is NoInternetState;
}
