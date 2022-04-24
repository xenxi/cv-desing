part of 'cv_editor_bloc.dart';

abstract class CveditorEvent extends Equatable {
  const CveditorEvent();
}

class SectionChanged extends CveditorEvent {
  const SectionChanged({required this.section});

  final Section section;
  @override
  List<Object> get props => [section];
}

class SkillAdded extends CveditorEvent {
  const SkillAdded({required this.skill});

  final String skill;
  @override
  List<Object> get props => [skill];
}

class SkillDeleted extends CveditorEvent {
  const SkillDeleted({required this.skill});

  final String skill;
  @override
  List<Object> get props => [skill];
}
