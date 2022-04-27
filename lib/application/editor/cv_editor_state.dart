part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        skills: Skills.empty(),
      );
  const CvEditorState({
    required this.section,
    required this.skills,
  });
  final Section section;
  final Skills skills;

  @override
  List<Object> get props => [section, skills];

  CvEditorState copyWith({
    Section? section,
    Skills? skills,
  }) {
    return CvEditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
    );
  }
}
