part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        resume: Resume.empty(),
      );
  const CvEditorState({
    required this.resume,
    required this.section,
  });

  final Resume resume;
  final Section section;
  @override
  List<Object> get props => [resume, section];

  CvEditorState copyWith({
    Resume? resume,
    Section? section,
  }) {
    return CvEditorState(
      resume: resume ?? this.resume,
      section: section ?? this.section,
    );
  }
}
