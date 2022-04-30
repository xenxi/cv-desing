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
