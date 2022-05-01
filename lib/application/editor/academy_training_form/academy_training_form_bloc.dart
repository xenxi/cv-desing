// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'academy_training_form_event.dart';
part 'academy_training_form_state.dart';

class AcademyTrainingFormBloc
    extends Bloc<AcademyTrainingFormEvent, AcademyTrainingFormState> {
  AcademyTrainingFormBloc() : super(AcademytrainingformInitial()) {
    on<AcademyTrainingFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
