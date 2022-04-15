import 'package:cv_desing_website_flutter/application/desing_details/desing_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DesingDetailsBloc should', () {
    test('has as initial state loading', () {
      final bloc = DesingDetailsBloc();

      expect(
        bloc.state,
        equals(
          Loading(),
        ),
      );
    });
  });
}
