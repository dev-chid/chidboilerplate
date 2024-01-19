part of 'example_bloc.dart';

@immutable
sealed class ExampleState {}

final class ExampleInitial extends ExampleState {}

final class ExampleSuccess extends ExampleState {
  final ExampleModel exampleModel;

  ExampleSuccess({required this.exampleModel});
}

final class ExampleFailure extends ExampleState {
  final String error;

  ExampleFailure(this.error);
}

final class ExampleLoading extends ExampleState {}
