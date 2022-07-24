import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/domain/resumes/entities/personal_information.dart';
import 'package:cv_desing_website_flutter/domain/resumes/resume.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorActorBloc should', () {
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
