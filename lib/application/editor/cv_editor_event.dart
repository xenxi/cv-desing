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

class NameChanged extends CvEditorEvent {
  const NameChanged(
    this.name,
  );
  final String name;

  @override
  List<Object> get props => [name];
}

class LocalityChanged extends CvEditorEvent {
  const LocalityChanged(
    this.locality,
  );
  final String locality;

  @override
  List<Object> get props => [locality];
}

class ProfessionChanged extends CvEditorEvent {
  const ProfessionChanged(
    this.profession,
  );
  final String profession;

  @override
  List<Object> get props => [profession];
}

class PersonalDescriptionChanged extends CvEditorEvent {
  const PersonalDescriptionChanged(
    this.personalDescription,
  );
  final String personalDescription;

  @override
  List<Object> get props => [personalDescription];
}

class EmailChanged extends CvEditorEvent {
  const EmailChanged(
    this.email,
  );
  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends CvEditorEvent {
  const PhoneNumberChanged(
    this.phoneNumber,
  );
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LanguageAdded extends CvEditorEvent {
  const LanguageAdded(
    this.language, {
    required this.level,
  });
  final String language;
  final String level;

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
