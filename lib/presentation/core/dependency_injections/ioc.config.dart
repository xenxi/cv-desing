// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i7;
import '../../../domain/auth/i_auth_facade.dart' as _i3;
import '../../../infrastructure/auth/firebase_auth_facade.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthFacade>(() =>
      _i4.FirebaseAuthFacade(get<_i5.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.factory<_i7.SignInFormBloc>(
      () => _i7.SignInFormBloc(get<_i3.IAuthFacade>()));
  return get;
}
