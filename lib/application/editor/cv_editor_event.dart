part of 'cv_editor_bloc.dart';

abstract class CvEditorEvent extends Equatable {
  const CvEditorEvent();
}

class SectionChanged extends CvEditorEvent {
  const SectionChanged({required this.section});

  final Section section;
  @override
  List<Object> get props => [section];
}

class SkillAdded extends CvEditorEvent {
  const SkillAdded({required this.skill});

  final String skill;
  @override
  List<Object> get props => [skill];
}

class PersonalInformationUpdated extends CvEditorEvent {
  const PersonalInformationUpdated({required this.personalInformation});

  final PersonalInformation personalInformation;
  @override
  List<Object> get props => [personalInformation];
}

class ContactInformationUpdated extends CvEditorEvent {
  const ContactInformationUpdated({required this.contactInformation});

  final ContactInformation contactInformation;
  @override
  List<Object> get props => [contactInformation];
}

class SkillDeleted extends CvEditorEvent {
  const SkillDeleted({required this.skill});

  final String skill;
  @override
  List<Object> get props => [skill];
}

class SoftwareSkillAdded extends CvEditorEvent {
  const SoftwareSkillAdded({
    required this.name,
    required this.percentage,
  });
  final String name;
  final double percentage;
  @override
  List<Object> get props => [name, percentage];
}

class SoftwareSkillDeleted extends CvEditorEvent {
  const SoftwareSkillDeleted({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [name];
}

class LanguageAdded extends CvEditorEvent {
  const LanguageAdded(
    this.language, {
    required this.level,
  });
  final String language;
  final LanguageLevel level;

  @override
  List<Object> get props => [language, level];
}

class LanguageDeleted extends CvEditorEvent {
  const LanguageDeleted(
    this.language,
  );
  final String language;

  @override
  List<Object> get props => [language];
}

class AcademyTrainingAdded extends CvEditorEvent {
  const AcademyTrainingAdded(
    this.academyTraining,
  );
  final AcademyTraining academyTraining;

  @override
  List<Object> get props => [academyTraining];
}

class AcademyTrainingDeleted extends CvEditorEvent {
  const AcademyTrainingDeleted(
    this.academyTraining,
  );
  final AcademyTraining academyTraining;

  @override
  List<Object> get props => [academyTraining];
}

class ComplementaryTrainingAdded extends CvEditorEvent {
  const ComplementaryTrainingAdded(
    this.complementaryTraining,
  );
  final ComplementaryTraining complementaryTraining;

  @override
  List<Object> get props => [complementaryTraining];
}

class ComplementaryTrainingDeleted extends CvEditorEvent {
  const ComplementaryTrainingDeleted(
    this.complementaryTraining,
  );
  final ComplementaryTraining complementaryTraining;

  @override
  List<Object> get props => [complementaryTraining];
}

class WorkExperienceAdded extends CvEditorEvent {
  const WorkExperienceAdded(
    this.workExperience,
  );
  final WorkExperience workExperience;

  @override
  List<Object> get props => [workExperience];
}

class WorkExperienceDeleted extends CvEditorEvent {
  const WorkExperienceDeleted(
    this.workExperience,
  );
  final WorkExperience workExperience;

  @override
  List<Object> get props => [workExperience];
}
