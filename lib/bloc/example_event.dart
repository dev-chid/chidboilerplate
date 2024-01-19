part of 'example_bloc.dart';

@immutable
sealed class ExampleEvent {}

final class ExampleFetched extends ExampleEvent {}
