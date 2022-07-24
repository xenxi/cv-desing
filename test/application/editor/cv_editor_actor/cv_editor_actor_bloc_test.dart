import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_templates.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorActorBloc should', () {
    test('has default template as initial state', () {
      final bloc = CvEditorActorBloc();

      expect(bloc.state.template, CvTemplates.green);
    });

    blocTest<CvEditorActorBloc, CvEditorActorState>(
      'update template',
      build: () => CvEditorActorBloc(),
      act: (bloc) => bloc
        ..add(const TemplateChanged(CvTemplates.pink))
        ..add(const TemplateChanged(CvTemplates.green)),
      expect: () => <CvEditorActorState>[
        CvEditorActorState(template: CvTemplates.pink, resume: Resume.empty()),
        CvEditorActorState(template: CvTemplates.green, resume: Resume.empty()),
      ],
    );
    final Resume anyResume = Resume.empty().copyWith(
      personalInformation: PersonalInformation.empty().copyWith(
        job: Job('anyJob'),
      ),
    );
    final Resume otherResume = Resume.empty().copyWith(
      personalInformation: PersonalInformation.empty().copyWith(
        job: Job('otherJob'),
      ),
    );
    blocTest<CvEditorActorBloc, CvEditorActorState>(
      'update resume',
      build: () => CvEditorActorBloc(),
      act: (bloc) => bloc
        ..add(ResumeChanged(anyResume))
        ..add(ResumeChanged(otherResume)),
      expect: () => <CvEditorActorState>[
        CvEditorActorState.initial().copyWith(resume: anyResume),
        CvEditorActorState.initial().copyWith(resume: otherResume),
      ],
    );
  });
}
