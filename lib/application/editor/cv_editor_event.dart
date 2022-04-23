part of 'cv_editor_bloc.dart';

abstract class CveditorEvent extends Equatable {
  const CveditorEvent();

  @override
  List<Object> get props => [];
}

class SectionChanged extends CveditorEvent {
  const SectionChanged({required this.section});

  final Section section;
}

enum Section {
  personalInformation,
  academicTraining,
}
