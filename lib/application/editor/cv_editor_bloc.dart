// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
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
      } else if (event is NameChanged) {
        emit(
          state.copyWith(
            name: event.name,
          ),
        );
      } else if (event is LocalityChanged) {
        emit(
          state.copyWith(
            locality: event.locality,
          ),
        );
      } else if (event is ProfessionChanged) {
        emit(
          state.copyWith(
            profession: event.profession,
          ),
        );
      } else if (event is PersonalDescriptionChanged) {
        emit(
          state.copyWith(
            personalDescription: event.personalDescription,
          ),
        );
      } else if (event is EmailChanged) {
        emit(
          state.copyWith(
            email: event.email,
          ),
        );
      } else if (event is PhoneNumberChanged) {
        emit(
          state.copyWith(
            phoneNumber: event.phoneNumber,
          ),
        );
      } else if (event is LanguageAdded) {
        emit(
          state.copyWith(
            languages: state.languages
                .add(Language(event.language, level: event.level)),
          ),
        );
      } else if (event is LanguageDeleted) {
        emit(
          state.copyWith(
            languages: state.languages.remove(Language(event.language)),
          ),
        );
      } else if (event is AcademyTrainingAdded) {
        emit(
          state.copyWith(
            academyTrainings: state.academyTrainings.add(event.academyTraining),
          ),
        );
      } else if (event is AcademyTrainingDeleted) {
        emit(
          state.copyWith(
            academyTrainings:
                state.academyTrainings.remove(event.academyTraining),
          ),
        );
      } else if (event is ComplementaryTrainingAdded) {
        emit(
          state.copyWith(
            complementaryTrainings:
                state.complementaryTrainings.add(event.complementaryTraining),
          ),
        );
      } else if (event is ComplementaryTrainingDeleted) {
        emit(
          state.copyWith(
            complementaryTrainings: state.complementaryTrainings
                .remove(event.complementaryTraining),
          ),
        );
      }
    });
  }
}
