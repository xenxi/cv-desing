import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/academy_training.dart';
import 'package:cv_desing_website_flutter/domain/complementary_training.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/course_hours.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/date_range.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/description.dart'
    as domainDescription;
import 'package:cv_desing_website_flutter/domain/value_objects/employer.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/languages.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/percentage.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/schoold.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/skills.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/software_skill.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/title.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/unique_id.dart';
import 'package:cv_desing_website_flutter/domain/work_experience.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = CvEditorState(
    complementaryTrainings: ComplementaryTrainings.empty(),
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
    academyTrainings: AcademyTrainings.empty(),
    workExperiences: WorkExperiences.empty(),
  );
  final otherAcademyTraining = AcademyTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 20)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('otherId'),
  );
  final anyAcademyTraining = AcademyTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 60)),
      until: null,
    ),
    uniqueId: UniqueId.fromString('anyId'),
  );

  final anyComplementaryTraining = ComplementaryTraining(
    schoold: Schoold('anySchoold'),
    title: Title('anyTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 10)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('anyId'),
    courseHoursOption: some(CourseHours(2)),
  );
  final otherComplementaryTraining = ComplementaryTraining(
    schoold: Schoold('otherSchoold'),
    title: Title('otherTitle'),
    dateRange: DateRange(
      since: DateTime.now().subtract(const Duration(days: 20)),
      until: DateTime.now(),
    ),
    uniqueId: UniqueId.fromString('otherId'),
    courseHoursOption: none(),
  );

  group('CvEditorBloc should', () {
    test('has empty as initial state', () {
      final bloc = CvEditorBloc();
      // assert
      expect(
        bloc.state,
        equals(
          initialState,
        ),
      );
    });

    blocTest<CvEditorBloc, CvEditorState>(
      'change to contact info section',
      build: () => CvEditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.contactInformation)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.contactInformation)
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'change to academic training section',
      build: () => CvEditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.academicTraining)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.academicTraining)
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'change to complementary formations section',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.complementaryFormations)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to work experience section',
      build: () => CvEditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.workExperience)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.workExperience)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to languages section',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc.add(const SectionChanged(section: Section.languages)),
      expect: () =>
          <CvEditorState>[initialState.copyWith(section: Section.languages)],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to software skills section',
      build: () => CvEditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.softwareSkills)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.softwareSkills)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'change to skills and aptitudes section',
      build: () => CvEditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.skillsandAptitudes)),
      expect: () => <CvEditorState>[
        initialState.copyWith(section: Section.skillsandAptitudes)
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update name',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const NameChanged('anyName'))
        ..add(const NameChanged('otherName')),
      expect: () => <CvEditorState>[
        initialState.copyWith(name: 'anyName'),
        initialState.copyWith(name: 'otherName'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update locality',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const LocalityChanged('anyLocality'))
        ..add(const LocalityChanged('otherLocality')),
      expect: () => <CvEditorState>[
        initialState.copyWith(locality: 'anyLocality'),
        initialState.copyWith(locality: 'otherLocality'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update profession',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const ProfessionChanged('anyProfession'))
        ..add(const ProfessionChanged('otherProfession')),
      expect: () => <CvEditorState>[
        initialState.copyWith(profession: 'anyProfession'),
        initialState.copyWith(profession: 'otherProfession'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update personal description',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const PersonalDescriptionChanged('anyPersonalDescription'))
        ..add(const PersonalDescriptionChanged('otherPersonalDescription')),
      expect: () => <CvEditorState>[
        initialState.copyWith(personalDescription: 'anyPersonalDescription'),
        initialState.copyWith(personalDescription: 'otherPersonalDescription'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update email',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const EmailChanged('anyEmail'))
        ..add(const EmailChanged('otherEmail')),
      expect: () => <CvEditorState>[
        initialState.copyWith(email: 'anyEmail'),
        initialState.copyWith(email: 'otherEmail'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update phone number',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const PhoneNumberChanged('anyPhoneNumber'))
        ..add(const PhoneNumberChanged('otherPhoneNumber')),
      expect: () => <CvEditorState>[
        initialState.copyWith(phoneNumber: 'anyPhoneNumber'),
        initialState.copyWith(phoneNumber: 'otherPhoneNumber'),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update languages',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const LanguageAdded('anyLanguage', level: 'anyLevel'))
        ..add(const LanguageAdded('otherLanguage', level: 'otherLevel'))
        ..add(const LanguageDeleted('otherLanguage')),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          languages: Languages([Language('anyLanguage', level: 'anyLevel')]),
        ),
        initialState.copyWith(
          languages: Languages([
            Language('anyLanguage', level: 'anyLevel'),
            Language('otherLanguage', level: 'otherLevel')
          ]),
        ),
        initialState.copyWith(
          languages: Languages([Language('anyLanguage', level: 'anyLevel')]),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update skills',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(const SkillAdded(skill: 'anySkill'))
        ..add(const SkillAdded(skill: 'otherSkill'))
        ..add(const SkillDeleted(skill: 'anySkill')),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          skills: const Skills(
            ['anySkill'],
          ),
        ),
        initialState.copyWith(
          skills: const Skills(
            ['anySkill', 'otherSkill'],
          ),
        ),
        initialState.copyWith(
          skills: const Skills(
            ['otherSkill'],
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update academy training',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(
          AcademyTrainingAdded(anyAcademyTraining),
        )
        ..add(
          AcademyTrainingAdded(
            otherAcademyTraining,
          ),
        )
        ..add(
          AcademyTrainingDeleted(
            otherAcademyTraining,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          academyTrainings: AcademyTrainings(
            [
              anyAcademyTraining,
            ],
          ),
        ),
        initialState.copyWith(
          academyTrainings: AcademyTrainings(
            [
              anyAcademyTraining,
              otherAcademyTraining,
            ],
          ),
        ),
        initialState.copyWith(
          academyTrainings: AcademyTrainings(
            [
              anyAcademyTraining,
            ],
          ),
        ),
      ],
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update complementary training',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(
          ComplementaryTrainingAdded(anyComplementaryTraining),
        )
        ..add(
          ComplementaryTrainingAdded(
            otherComplementaryTraining,
          ),
        )
        ..add(
          ComplementaryTrainingDeleted(
            otherComplementaryTraining,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          complementaryTrainings: ComplementaryTrainings(
            [
              anyComplementaryTraining,
            ],
          ),
        ),
        initialState.copyWith(
          complementaryTrainings: ComplementaryTrainings(
            [
              anyComplementaryTraining,
              otherComplementaryTraining,
            ],
          ),
        ),
        initialState.copyWith(
          complementaryTrainings: ComplementaryTrainings(
            [
              anyComplementaryTraining,
            ],
          ),
        ),
      ],
    );

    blocTest<CvEditorBloc, CvEditorState>(
      'update software skills',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(
          const SoftwareSkillAdded(name: 'anySoftwareSkillA', percentage: 50),
        )
        ..add(
          const SoftwareSkillAdded(name: 'otherSoftwareSkillA', percentage: 10),
        )
        ..add(
          const SoftwareSkillDeleted(name: 'otherSoftwareSkillA'),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          softwareSkills: SoftwareSkills(
            [
              SoftwareSkill(
                'anySoftwareSkillA',
                percentage: Percentage(50),
              ),
            ],
          ),
        ),
        initialState.copyWith(
          softwareSkills: SoftwareSkills(
            [
              SoftwareSkill(
                'anySoftwareSkillA',
                percentage: Percentage(50),
              ),
              SoftwareSkill(
                'otherSoftwareSkillA',
                percentage: Percentage(10),
              ),
            ],
          ),
        ),
        initialState.copyWith(
          softwareSkills: SoftwareSkills(
            [
              SoftwareSkill(
                'anySoftwareSkillA',
                percentage: Percentage(50),
              ),
            ],
          ),
        ),
      ],
    );
    final anyWorkExperience = WorkExperience(
      dateRange: DateRange(
        since: DateTime.now().subtract(const Duration(days: 10)),
        until: DateTime.now(),
      ),
      description: domainDescription.Description('anyDescription'),
      employer: Employer('anyEmployer'),
      job: Job('anyJob'),
      uniqueId: UniqueId.fromString('anyUniqueId'),
    );
    final otherWorkExperience = WorkExperience(
      dateRange: DateRange(
        since: DateTime.now().subtract(const Duration(days: 1)),
        until: null,
      ),
      description: domainDescription.Description('otherDescription'),
      employer: Employer('otherEmployer'),
      job: Job('otherJob'),
      uniqueId: UniqueId.fromString('otherUniqueId'),
    );
    blocTest<CvEditorBloc, CvEditorState>(
      'update work experience',
      build: () => CvEditorBloc(),
      act: (bloc) => bloc
        ..add(
          WorkExperienceAdded(anyWorkExperience),
        )
        ..add(
          WorkExperienceAdded(
            otherWorkExperience,
          ),
        )
        ..add(
          WorkExperienceDeleted(
            otherWorkExperience,
          ),
        ),
      expect: () => <CvEditorState>[
        initialState.copyWith(
          workExperiences: WorkExperiences(
            [
              anyWorkExperience,
            ],
          ),
        ),
        initialState.copyWith(
          workExperiences: WorkExperiences(
            [
              anyWorkExperience,
              otherWorkExperience,
            ],
          ),
        ),
        initialState.copyWith(
          workExperiences: WorkExperiences(
            [
              anyWorkExperience,
            ],
          ),
        ),
      ],
    );
  });
}
