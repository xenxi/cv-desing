// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'software_skills_form_event.dart';
part 'software_skills_form_state.dart';

class SoftwareSkillsFormBloc
    extends Bloc<SoftwareSkillsFormEvent, SoftwareSkillsFormState> {
  SoftwareSkillsFormBloc() : super(SkillsformInitial()) {
    on<SoftwareSkillsFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
