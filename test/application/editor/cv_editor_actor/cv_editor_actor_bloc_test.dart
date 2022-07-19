import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_editor_actor_bloc.dart';
import 'package:cv_desing_website_flutter/application/editor/cv_editor_actor/cv_templates.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorActorBloc should', () {
    test('has default template as initial state', () {
      final bloc = CvEditorActorBloc();

      expect(bloc.state.template, CvTemplates.green);
    });
  });
}
