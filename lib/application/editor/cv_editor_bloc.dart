// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/contact_information_form/contact_information_form_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/contact_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/work_experience.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cv_editor_event.dart';
part 'cv_editor_state.dart';

@injectable
class CvEditorBloc extends Bloc<CvEditorEvent, CvEditorState> {
  CvEditorBloc(
    this.contactInformationFormBloc,
  ) : super(CvEditorState.initial()) {
    on<CvEditorEvent>((event, emit) {
      if (event is SectionChanged) {
        emit(state.copyWith(section: event.section));
      } else if (event is SkillAdded) {
        emit(
          state.copyWith(
            resume: state.resume
                .copyWith(skills: state.resume.skills.add(event.skill)),
          ),
        );
      } else if (event is SkillDeleted) {
        emit(
          state.copyWith(
            resume: state.resume
                .copyWith(skills: state.resume.skills.remove(event.skill)),
          ),
        );
      } else if (event is SoftwareSkillAdded) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              softwareSkills: state.resume.softwareSkills.add(
                SoftwareSkill(
                  event.name,
                  percentage: Percentage(event.percentage),
                ),
              ),
            ),
          ),
        );
      } else if (event is SoftwareSkillDeleted) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              softwareSkills: state.resume.softwareSkills.remove(
                SoftwareSkill(
                  event.name,
                ),
              ),
            ),
          ),
        );
      } else if (event is LanguageAdded) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              languages: state.resume.languages
                  .add(Language(event.language, level: event.level)),
            ),
          ),
        );
      } else if (event is LanguageDeleted) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              languages: state.resume.languages.remove(
                Language(
                  event.language,
                ),
              ),
            ),
          ),
        );
      } else if (event is AcademyTrainingAdded) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              academyTrainings:
                  state.resume.academyTrainings.add(event.academyTraining),
            ),
          ),
        );
      } else if (event is AcademyTrainingDeleted) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              academyTrainings:
                  state.resume.academyTrainings.remove(event.academyTraining),
            ),
          ),
        );
      } else if (event is ComplementaryTrainingAdded) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              complementaryTrainings: state.resume.complementaryTrainings
                  .add(event.complementaryTraining),
            ),
          ),
        );
      } else if (event is ComplementaryTrainingDeleted) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              complementaryTrainings: state.resume.complementaryTrainings
                  .remove(event.complementaryTraining),
            ),
          ),
        );
      } else if (event is WorkExperienceAdded) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              workExperiences:
                  state.resume.workExperiences.add(event.workExperience),
            ),
          ),
        );
      } else if (event is WorkExperienceDeleted) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              workExperiences:
                  state.resume.workExperiences.remove(event.workExperience),
            ),
          ),
        );
      } else if (event is PersonalInformationUpdated) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              personalInformation: event.personalInformation,
            ),
          ),
        );
      } else if (event is ContactInformationUpdated) {
        emit(
          state.copyWith(
            resume: state.resume.copyWith(
              contactInformation: event.contactInformation,
            ),
          ),
        );
      } else if (event is Loaded) {
        emit(state.copyWith(resume: event.resume));
      } else if (event is Cleaned) {
        emit(state.copyWith(resume: Resume.empty()));
      }
    });
  }
  final ContactInformationFormBloc contactInformationFormBloc;
}
