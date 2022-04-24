import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:cv_desing_website_flutter/domain/skills.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorBloc should', () {
    test('has empty as initial state', () {
      final bloc = CveditorBloc();
      // assert
      expect(
        bloc.state,
        equals(
          CveditorState(
            section: Section.personalInformation,
            skills: Skills.empty(),
          ),
        ),
      );
    });

    blocTest<CveditorBloc, CveditorState>(
      'change to contact info section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.contactInformation)),
      expect: () => <CveditorState>[
        CveditorState(
            section: Section.contactInformation, skills: Skills.empty())
      ],
    );

    blocTest<CveditorBloc, CveditorState>(
      'change to academic training section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.academicTraining)),
      expect: () => <CveditorState>[
        CveditorState(section: Section.academicTraining, skills: Skills.empty())
      ],
    );

    blocTest<CveditorBloc, CveditorState>(
      'change to complementary formations section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CveditorState>[
        CveditorState(
          section: Section.complementaryFormations,
          skills: Skills.empty(),
        )
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to complementary formations section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CveditorState>[
        CveditorState(
          section: Section.complementaryFormations,
          skills: Skills.empty(),
        )
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to work experience section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.workExperience)),
      expect: () => <CveditorState>[
        CveditorState(section: Section.workExperience, skills: Skills.empty())
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to languages section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc.add(const SectionChanged(section: Section.languages)),
      expect: () => <CveditorState>[
        CveditorState(section: Section.languages, skills: Skills.empty())
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to software skills section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.softwareSkills)),
      expect: () => <CveditorState>[
        CveditorState(section: Section.softwareSkills, skills: Skills.empty())
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to skillsand aptitudes section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.skillsandAptitudes)),
      expect: () => <CveditorState>[
        CveditorState(
            section: Section.skillsandAptitudes, skills: Skills.empty())
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'update skills',
      build: () => CveditorBloc(),
      act: (bloc) => bloc
        ..add(const SkillAdded(skill: 'anySkill'))
        ..add(const SkillAdded(skill: 'otherSkill'))
        ..add(const SkillDeleted(skill: 'anySkill')),
      expect: () => <CveditorState>[
        const CveditorState(
          section: Section.personalInformation,
          skills: Skills(['anySkill']),
        ),
        const CveditorState(
          section: Section.personalInformation,
          skills: Skills(['anySkill', 'otherSkill']),
        ),
        const CveditorState(
          section: Section.personalInformation,
          skills: Skills(['otherSkill']),
        ),
      ],
    );
  });
}
