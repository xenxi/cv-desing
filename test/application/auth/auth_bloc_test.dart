import 'package:bloc_test/bloc_test.dart';
import 'package:cv_desing_website_flutter/application/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('auth should', () {
    test('be in initial state', () {
      final bloc = AuthBloc();

      expect(bloc.state, equals(Initial()));
    });

    blocTest<AuthBloc, AuthState>(
      'emits Authenticated when AuthCheckRequested is added and user is authenticated',
      build: () => AuthBloc(),
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => <AuthState>[Authenticated()],
    );
  });
}
