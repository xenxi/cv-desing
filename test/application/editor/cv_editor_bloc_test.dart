import 'package:cv_desing_website_flutter/application/editor/cv_editor_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CvEditorBloc should', () {
    test('has empty as initial state', () {
      final bloc = CveditorBloc();
      // assert
      expect(bloc.state, equals(Empty()));
    });
  });
}
