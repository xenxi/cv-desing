import 'package:cv_desing_website_flutter/application/desings/desings_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DesingsBloc should', () {
    test('be empty as initial state', () {
      final bloc = DesingsBloc();

      expect(bloc.state, equals(DesingsInitial()));
    });
  });
}
