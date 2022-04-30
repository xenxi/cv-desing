part of 'cv_editor_bloc.dart';

class CvEditorState extends Equatable {
  factory CvEditorState.initial() => CvEditorState(
        section: Section.personalInformation,
        skills: Skills.empty(),
        softwareSkills: SoftwareSkills.empty(),
        name: '',
        locality: '',
        profession: '',
        personalDescription: '',
        email: '',
        phoneNumber: '',
        languages: Languages.empty(),
      );
  const CvEditorState({
    required this.section,
    required this.skills,
    required this.softwareSkills,
    required this.name,
    required this.locality,
    required this.profession,
    required this.personalDescription,
    required this.email,
    required this.phoneNumber,
    required this.languages,
  });
  final Section section;
  final Skills skills;
  final SoftwareSkills softwareSkills;
  final String name;
  final String locality;
  final String profession;
  final String personalDescription;
  final String email;
  final String phoneNumber;
  final Languages languages;
  @override
  List<Object> get props => [
        section,
        skills,
        softwareSkills,
        name,
        locality,
        profession,
        personalDescription,
        email,
        phoneNumber,
        languages,
      ];

  CvEditorState copyWith({
    Section? section,
    Skills? skills,
    SoftwareSkills? softwareSkills,
    String? name,
    String? locality,
    String? profession,
    String? personalDescription,
    String? email,
    String? phoneNumber,
    Languages? languages,
  }) {
    return CvEditorState(
      section: section ?? this.section,
      skills: skills ?? this.skills,
      softwareSkills: softwareSkills ?? this.softwareSkills,
      name: name ?? this.name,
      locality: locality ?? this.locality,
      profession: profession ?? this.profession,
      personalDescription: personalDescription ?? this.personalDescription,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      languages: languages ?? this.languages,
    );
  }
}
