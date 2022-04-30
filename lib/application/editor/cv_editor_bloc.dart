// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/percentage.dart';
import 'package:cv_desing_website_flutter/domain/skills.dart';
import 'package:cv_desing_website_flutter/domain/software_skill.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cv_editor_event.dart';
part 'cv_editor_state.dart';

@injectable
class CvEditorBloc extends Bloc<CvEditorEvent, CvEditorState> {
  CvEditorBloc() : super(CvEditorState.initial()) {
    on<CvEditorEvent>((event, emit) {
      if (event is SectionChanged) {
        emit(state.copyWith(section: event.section));
      } else if (event is SkillAdded) {
        emit(
          state.copyWith(
            skills: state.skills.add(event.skill),
          ),
        );
      } else if (event is SkillDeleted) {
        emit(
          state.copyWith(
            skills: state.skills.remove(event.skill),
          ),
        );
      } else if (event is SoftwareSkillAdded) {
        emit(
          state.copyWith(
            softwareSkills: state.softwareSkills.add(
              SoftwareSkill(
                event.name,
                percentage: Percentage(event.percentage),
              ),
            ),
          ),
        );
      } else if (event is SoftwareSkillDeleted) {
        emit(
          state.copyWith(
            softwareSkills:
                state.softwareSkills.remove(SoftwareSkill(event.name)),
          ),
        );
      }
    });
  }
}
