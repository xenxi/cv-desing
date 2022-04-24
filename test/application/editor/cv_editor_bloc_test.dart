import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/sections.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorBloc should', () {
    test('has empty as initial state', () {
      final bloc = CveditorBloc();
      // assert
      expect(
        bloc.state,
        equals(const CveditorState(section: Section.personalInformation)),
      );
    });

    blocTest<CveditorBloc, CveditorState>(
      'change to academic training section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.academicTraining)),
      expect: () => <CveditorState>[
        const CveditorState(section: Section.academicTraining)
      ],
    );

    blocTest<CveditorBloc, CveditorState>(
      'change to complementary formations section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CveditorState>[
        const CveditorState(section: Section.complementaryFormations)
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to complementary formations section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc
          .add(const SectionChanged(section: Section.complementaryFormations)),
      expect: () => <CveditorState>[
        const CveditorState(section: Section.complementaryFormations)
      ],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to work experience section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.workExperience)),
      expect: () =>
          <CveditorState>[const CveditorState(section: Section.workExperience)],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to languages section',
      build: () => CveditorBloc(),
      act: (bloc) => bloc.add(const SectionChanged(section: Section.languages)),
      expect: () =>
          <CveditorState>[const CveditorState(section: Section.languages)],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to software skills section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.softwareSkills)),
      expect: () =>
          <CveditorState>[const CveditorState(section: Section.softwareSkills)],
    );
    blocTest<CveditorBloc, CveditorState>(
      'change to skillsand aptitudes section',
      build: () => CveditorBloc(),
      act: (bloc) =>
          bloc.add(const SectionChanged(section: Section.skillsandAptitudes)),
      expect: () => <CveditorState>[
        const CveditorState(section: Section.skillsandAptitudes)
      ],
    );
  });
}