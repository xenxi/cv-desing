part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  // factory CvEditorState.initial() => CvEditorState(
  //       section: Section.personalInformation,
  //       resume: Resume.empty(),
  //       template: CvTemplates.green,
  //     );
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        resume: getIt<ExampleResumeData>().jonDoe,
        template: CvTemplates.creativeGreen,
      );
  const CvEditorState({
    required this.template,
    required this.resume,
    required this.section,
  });
  final CvTemplates template;
  final Resume resume;
  final Section section;
  @override
  List<Object> get props => [resume, section, template];

  CvEditorState copyWith({
    CvTemplates? template,
    Resume? resume,
    Section? section,
  }) {
    return CvEditorState(
      template: template ?? this.template,
      resume: resume ?? this.resume,
      section: section ?? this.section,
    );
  }
}
