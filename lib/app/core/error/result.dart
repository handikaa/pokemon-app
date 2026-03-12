import 'failures.dart';

class Result<T> {
  final T? data;
  final Failure? failure;

  const Result._({this.data, this.failure});

  const Result.success(T data) : this._(data: data);

  const Result.failure(Failure failure) : this._(failure: failure);

  bool get isSuccess => data != null;
  bool get isFailure => failure != null;
}
