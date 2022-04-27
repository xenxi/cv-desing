import 'package:cv_desing_website_flutter/application/editor/software_skills_form/software_skills_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SkillsForm should', () {
    test('has empty as initial state', () {
      final bloc = SoftwareSkillsFormBloc();
      // assert
      expect(
        bloc.state,
        equals(
          SkillsformInitial(),
        ),
      );
    });
  });
}
