// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i13;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i12;
import '../../../application/desings/desings_bloc.dart' as _i17;
import '../../../application/desings/details/desing_details_bloc.dart' as _i16;
import '../../../application/navigation/navigation_bloc.dart' as _i11;
import '../../../domain/auth/i_auth_facade.dart' as _i6;
import '../../../domain/desing.dart' as _i10;
import '../../../domain/i_desings.dart' as _i14;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i7;
import '../../../infrastructure/core/register_module.dart' as _i18;
import '../../../infrastructure/in_memory_desings.dart' as _i15;
import '../routes/navigators/custom_navigator.dart' as _i9;
import '../routes/navigators/i_navigator.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i4.GlobalKey<_i4.NavigatorState>>(() => registerModule.key);
  gh.lazySingleton<_i5.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.factory<_i8.INavigator>(
      () => _i9.CustomNavigator(get<_i4.GlobalKey<_i4.NavigatorState>>()));
  gh.lazySingleton<List<_i10.Desing>>(() => registerModule.desings);
  gh.factory<_i11.NavigationBloc>(
      () => _i11.NavigationBloc(get<_i8.INavigator>()));
  gh.factory<_i12.SignInFormBloc>(
      () => _i12.SignInFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i6.IAuthFacade>()));
  gh.lazySingleton<_i14.IDesings>(
      () => _i15.InMemoryDesings(get<List<_i10.Desing>>()));
  gh.factory<_i16.DesingDetailsBloc>(
      () => _i16.DesingDetailsBloc(get<_i14.IDesings>()));
  gh.factory<_i17.DesingsBloc>(() => _i17.DesingsBloc(get<_i14.IDesings>()));
  return get;
}

class _$RegisterModule extends _i18.RegisterModule {}
