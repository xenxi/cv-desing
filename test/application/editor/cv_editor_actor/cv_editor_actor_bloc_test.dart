import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_templates.dart';
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
        const CvEditorActorState(template: CvTemplates.pink),
        const CvEditorActorState(template: CvTemplates.green),
      ],
    );
  });
}
