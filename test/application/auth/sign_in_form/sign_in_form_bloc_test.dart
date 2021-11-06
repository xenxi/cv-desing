import 'package:cv_desing_website_flutter/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SignInFormBloc bloc;

  setUp(() {
    bloc = SignInFormBloc();
  });

  test('initial state should be empty', () {
    expect(bloc.state, equals(Empty()));
  });
}
