part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        skills: Skills.empty(),
        softwareSkills: SoftwareSkills.empty(),
      );
  const CvEditorState({
    required this.section,
    required this.skills,
    required this.softwareSkills,
  });
  final Section section;
  final Skills skills;
  final SoftwareSkills softwareSkills;

  @override
  List<Object> get props => [section, skills];

  CvEditorState copyWith({
    Section? section,
    Skills? skills,
    SoftwareSkills? softwareSkills,
  }) {
    return CvEditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
      softwareSkills: softwareSkills ?? this.softwareSkills,
    );
  }
}
