import 'package:cv_desing_website_flutter/application/navigation/bloc/navigation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NavigationBloc should', () {
    test('has default route in initial state', () {
      final bloc = NavigationBloc();

      expect(bloc.state.routeName, equals('/'));
    });
  });
}
