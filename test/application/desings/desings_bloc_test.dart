import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/desings/desings_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/desing_mother.dart';

class MockIDesings extends Mock implements IDesings {}

void main() {
  group('DesingsBloc should', () {
    final anyDesings = DesingMother.randoms();
    late IDesings desings;
    setUp(() {
      desings = MockIDesings();
    });
    test('be empty as initial state', () {
      final bloc = DesingsBloc(desings);

      expect(
        bloc.state,
        equals(
          DesingsState(
            desings: const [],
            isLoading: false,
            categoryOption: none(),
          ),
        ),
      );
    });

    blocTest<DesingsBloc, DesingsState>(
      'search curriculums',
      build: () => DesingsBloc(desings),
      setUp: () => when(() => desings.search(category: Category.curriculum))
          .thenAnswer((_) => Future.value(right(anyDesings))),
      act: (bloc) =>
          bloc.add(const FilterCategoryChanged(category: Category.curriculum)),
      expect: () => <DesingsState>[
        const DesingsState(
          desings: [],
          isLoading: true,
          categoryOption: Some(Category.curriculum),
        ),
        DesingsState(
          desings: anyDesings,
          isLoading: false,
          categoryOption: const Some(Category.curriculum),
        ),
      ],
    );
  });
}
