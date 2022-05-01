import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/editor/academy_training_form/academy_training_form_bloc.dart';
import 'package:cv_desing_website_flutter/domain/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcademyTrainingFormBloc should', () {
    test('has empty as initial state', () {
      final bloc = AcademyTrainingFormBloc();
      // assert
      expect(
        bloc.state,
        equals(
          AcademyTrainingFormState(title: Title.empty()),
        ),
      );
    });

    blocTest<AcademyTrainingFormBloc, AcademyTrainingFormState>(
      'update title',
      build: () => AcademyTrainingFormBloc(),
      act: (bloc) => bloc
        ..add(const TitleChanged('anyTitle'))
        ..add(const TitleChanged('otherTitle')),
      expect: () => <AcademyTrainingFormState>[
        AcademyTrainingFormState(title: Title.create('anyTitle')),
        AcademyTrainingFormState(title: Title.create('otherTitle')),
      ],
    );
  });
}
