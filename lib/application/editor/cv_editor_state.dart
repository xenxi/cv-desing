part of 'cv_editor_bloc.dart';

class CveditorState extends Equatable {
  factory CveditorState.initial() =>
      const CveditorState(section: Section.personalInformation, skills: []);
  const CveditorState({
    required this.section,
    required this.skills,
  });
  final Section section;
  final List<String> skills;

  @override
  List<Object> get props => [section, skills];

  CveditorState copyWith({
    Section? section,
    List<String>? skills,
  }) {
    return CveditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
    );
  }
}
