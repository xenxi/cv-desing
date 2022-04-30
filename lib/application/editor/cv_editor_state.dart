part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        skills: Skills.empty(),
        softwareSkills: SoftwareSkills.empty(),
        name: '',
        locality: '',
      );
  const CvEditorState({
    required this.section,
    required this.skills,
    required this.softwareSkills,
    required this.name,
    required this.locality,
  });
  final Section section;
  final Skills skills;
  final SoftwareSkills softwareSkills;
  final String name;
  final String locality;
  @override
  List<Object> get props => [section, skills, softwareSkills, name, locality];

  CvEditorState copyWith({
    Section? section,
    Skills? skills,
    SoftwareSkills? softwareSkills,
    String? name,
    String? locality,
  }) {
    return CvEditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
      softwareSkills: softwareSkills ?? this.softwareSkills,
      name: name ?? this.name,
      locality: locality ?? this.locality,
    );
  }
}
