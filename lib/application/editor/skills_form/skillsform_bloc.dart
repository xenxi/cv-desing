// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skillsform_event.dart';
part 'skillsform_state.dart';

class SkillsformBloc extends Bloc<SkillsformEvent, SkillsformState> {
  SkillsformBloc() : super(SkillsformInitial()) {
    on<SkillsformEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
