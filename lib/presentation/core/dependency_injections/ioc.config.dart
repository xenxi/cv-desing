// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i12;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i11;
import '../../../application/navigation/bloc/navigation_bloc.dart' as _i9;
import '../../../domain/auth/i_auth_facade.dart' as _i7;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i8;
import '../../../infrastructure/core/register_module.dart' as _i13;
import '../routes/navigators/custom_navigator.dart' as _i3;
import '../routes/navigators/i_navigator.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CustomNavigator>(
      _i3.CustomNavigator(get<_i4.GlobalKey<_i4.NavigatorState>>()));
  gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(() =>
      _i8.FirebaseAuthFacade(get<_i5.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.factory<_i9.NavigationBloc>(
      () => _i9.NavigationBloc(get<_i10.INavigator>()));
  gh.factory<_i11.SignInFormBloc>(
      () => _i11.SignInFormBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(get<_i7.IAuthFacade>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
