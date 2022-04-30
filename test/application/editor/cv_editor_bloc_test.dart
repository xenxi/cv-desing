import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/percentage.dart';
import 'package:cv_desing_website_flutter/domain/skills.dart';
import 'package:cv_desing_website_flutter/domain/software_skill.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialState = CvEditorState(
    section: Section.personalInformation,
    skills: Skills.empty(),
    softwareSkills: SoftwareSkills.empty(),
    name: '',
    locality: '',
    profession: '',
    personalDescription: '',
    email: '',
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
  });
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
        softwareSkills: const SoftwareSkills(
          [
            SoftwareSkill(
              'anySoftwareSkillA',
              percentage: Percentage(50),
            ),
          ],
        ),
      ),
      initialState.copyWith(
        softwareSkills: const SoftwareSkills(
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
        softwareSkills: const SoftwareSkills(
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
}
