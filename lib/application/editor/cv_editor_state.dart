part of 'cv_editor_bloc.dart';

class CveditorState extends Equatable {
  factory CveditorState.initial() =>
      const CveditorState(section: Section.personalInformation);
  const CveditorState({
    required this.section,
  });
  final Section section;

  @override
  List<Object> get props => [section];

  CveditorState copyWith({
    Section? section,
  }) {
    return CveditorState(
      section: section ?? this.section,
    );
  }
}
