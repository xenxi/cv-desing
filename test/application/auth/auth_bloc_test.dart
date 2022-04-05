import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/auth/auth_bloc.dart';
import 'package:cv_desing_website_flutter/domain/auth/i_auth_facade.dart';
import 'package:cv_desing_website_flutter/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIAuthFacade extends Mock implements IAuthFacade {}

void main() {
  late MockIAuthFacade authFacade;
  final anyAuthUser = User(avatarUrl: none());
  setUp(() {
    authFacade = MockIAuthFacade();
  });
  group('auth should', () {
    test('be in initial state', () {
      final bloc = AuthBloc(authFacade);

      expect(bloc.state, equals(Initial()));
    });

    blocTest<AuthBloc, AuthState>(
      'emits Authenticated when AuthCheckRequested is added and user is authenticated',
      build: () => AuthBloc(authFacade),
      setUp: () => when(
        () => authFacade.getSignedInUser(),
      ).thenAnswer((_) => Future.value(some(anyAuthUser))),
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => <AuthState>[Authenticated(anyAuthUser)],
    );
    blocTest<AuthBloc, AuthState>(
      'emits Unauthenticated when AuthCheckRequested is added and user is not authenticated',
      build: () => AuthBloc(authFacade),
      setUp: () => when(
        () => authFacade.getSignedInUser(),
      ).thenAnswer((_) => Future.value(none())),
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => <AuthState>[Unauthenticated()],
    );
    blocTest<AuthBloc, AuthState>(
      'emits Unauthenticated when SignOut is added and signout current user',
      build: () => AuthBloc(authFacade),
      setUp: () => when(
        () => authFacade.signOut(),
      ).thenAnswer((_) => Future.value()),
      act: (bloc) => bloc.add(SignOut()),
      verify: (_) => verify(
        () => authFacade.signOut(),
      ).called(1),
      expect: () => <AuthState>[Unauthenticated()],
    );
  });
}
