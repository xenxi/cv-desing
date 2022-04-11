import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/navigators/i_navigator.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockINavigator extends Mock implements INavigator {}

void main() {
  late MockINavigator navigator;

  setUp(() {
    navigator = MockINavigator();
    when(() => navigator.navigateTo(any())).thenAnswer((_) => Future.value());
  });
  group('NavigationBloc should', () {
    test('has default route in initial state', () {
      final bloc = NavigationBloc(navigator);

      expect(
        bloc.state,
        equals(
          const NavigationState(path: '/', displayName: Location.home),
        ),
      );
    });

    blocTest<NavigationBloc, NavigationState>(
      'navigate to home page',
      build: () => NavigationBloc(navigator),
      act: (bloc) => bloc.add(const NavigateToHomeSelected()),
      verify: (_) => verify(
        () => navigator.navigateTo('/home'),
      ).called(1),
      expect: () => const <NavigationState>[
        NavigationState(path: '/home', displayName: Location.home),
      ],
    );
    blocTest<NavigationBloc, NavigationState>(
      'navigate to desings page',
      build: () => NavigationBloc(navigator),
      act: (bloc) => bloc.add(const NavigateToDesingsSelected()),
      verify: (_) => verify(
        () => navigator.navigateTo('/desings'),
      ).called(1),
      expect: () => const <NavigationState>[
        NavigationState(path: '/desings', displayName: Location.desings),
      ],
    );
  });
}
