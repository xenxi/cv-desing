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
