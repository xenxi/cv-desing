part of 'cv_editor_bloc.dart';

class CveditorState extends Equatable {
  factory CveditorState.initial() => CveditorState(
        section: Section.personalInformation,
        skills: Skills.empty(),
      );
  const CveditorState({
    required this.section,
    required this.skills,
  });
  final Section section;
  final Skills skills;

  @override
  List<Object> get props => [section, skills];

  CveditorState copyWith({
    Section? section,
    Skills? skills,
  }) {
    return CveditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
    );
  }
}
