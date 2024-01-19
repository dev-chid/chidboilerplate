import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:chidboilerplate/data/repository/example_repository.dart';
import 'package:chidboilerplate/models/example_model.dart';
part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final ExampleRepository exampleRepository;
  ExampleBloc(this.exampleRepository) : super(ExampleInitial()) {
    on<ExampleFetched>(_getCurrentExample);
  }

  void _getCurrentExample(
    ExampleFetched event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());
    try {
      final example = await exampleRepository.getCurrentWeather();
      emit(ExampleSuccess(exampleModel: example));
    } catch (e) {
      emit(ExampleFailure(e.toString()));
    }
  }
}
