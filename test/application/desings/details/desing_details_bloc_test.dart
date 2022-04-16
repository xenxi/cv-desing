import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/desings/details/desing_details_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIDesings extends Mock implements IDesings {}

void main() {
  const anyDesing = Desing(
    id: 1,
    reference: 'anyReference',
    fileName: 'anyFileName',
    category: Category.curriculum,
    price: 1,
  );
  const anyFailure = Failure('anyFailure');
  late MockIDesings desings;

  void aFailedGetByReferenceRequest(Failure failure) =>
      when(() => desings.getByReference(any()))
          .thenAnswer((_) => Future.value(left(failure)));

  void shouldFindByReference(Desing desing) =>
      when(() => desings.getByReference(desing.reference))
          .thenAnswer((_) => Future.value(right(desing)));

  setUp(() {
    desings = MockIDesings();
  });
  group('DesingDetailsBloc should', () {
    test('has as initial state loading', () {
      final bloc = DesingDetailsBloc(desings);

      expect(
        bloc.state,
        equals(
          Loading(),
        ),
      );
    });

    blocTest<DesingDetailsBloc, DesingDetailsState>(
      'load desing',
      build: () => DesingDetailsBloc(desings),
      setUp: () => shouldFindByReference(anyDesing),
      act: (bloc) => bloc.add(DesingOpened(reference: anyDesing.reference)),
      expect: () => <DesingDetailsState>[
        const LoadSuccess(anyDesing),
      ],
    );

    blocTest<DesingDetailsBloc, DesingDetailsState>(
      'not load a non-existent desing',
      build: () => DesingDetailsBloc(desings),
      setUp: () => aFailedGetByReferenceRequest(anyFailure),
      act: (bloc) =>
          bloc.add(const DesingOpened(reference: 'anyNonExistentReference')),
      expect: () => <DesingDetailsState>[
        const LoadFailure(anyFailure),
      ],
    );
  });
}
