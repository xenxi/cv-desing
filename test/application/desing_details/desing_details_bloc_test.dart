import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/desing_details/desing_details_bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIDesings extends Mock implements IDesings {}

void main() {
  final anyDesing = Desing(
    id: 1,
    reference: 'anyReference',
    fileName: 'anyFileName',
    category: Category.curriculum,
    price: 1,
  );
  final anyFailure = Failure('anyFailure');
  late MockIDesings desings;

  void aFailedGetByReferenceRequest() =>
      when(() => desings.getByReference(any()))
          .thenAnswer((_) => Future.value(left(anyFailure)));

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
      setUp: () {
        when(() => desings.getByReference('anyReference'))
            .thenAnswer((_) => Future.value(right(anyDesing)));
      },
      act: (bloc) => bloc.add(const DesingOpened(reference: 'anyReference')),
      expect: () => <DesingDetailsState>[
        LoadSuccess(anyDesing),
      ],
    );

    blocTest<DesingDetailsBloc, DesingDetailsState>(
      'not load a non-existent desing',
      build: () => DesingDetailsBloc(desings),
      setUp: () => aFailedGetByReferenceRequest(),
      act: (bloc) => bloc.add(const DesingOpened(reference: 'anyReference')),
      expect: () => <DesingDetailsState>[
        const LoadFailure(Failure('anyError')),
      ],
    );
  });
}
