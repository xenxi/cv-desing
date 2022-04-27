// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skillsform_event.dart';
part 'skillsform_state.dart';

class SkillsFormBloc extends Bloc<SkillsFormEvent, SkillsFormState> {
  SkillsFormBloc() : super(SkillsformInitial()) {
    on<SkillsFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
