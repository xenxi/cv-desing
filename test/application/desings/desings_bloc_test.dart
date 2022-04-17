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

    group('search ', () {
      for (final category in Category.values) {
        blocTest<DesingsBloc, DesingsState>(
          '$category',
          build: () => DesingsBloc(desings),
          setUp: () => when(() => desings.search(category: category))
              .thenAnswer((_) => Future.value(right(anyDesings))),
          act: (bloc) => bloc.add(FilterCategoryChanged(category: category)),
          expect: () => <DesingsState>[
            DesingsState(
              desings: const [],
              isLoading: true,
              categoryOption: Some(category),
            ),
            DesingsState(
              desings: anyDesings,
              isLoading: false,
              categoryOption: Some(category),
            ),
          ],
        );
      }
    });
  });
}
