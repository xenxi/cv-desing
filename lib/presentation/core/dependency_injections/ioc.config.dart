// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i14;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i13;
import '../../../application/desings/desings_bloc.dart' as _i18;
import '../../../application/desings/details/desing_details_bloc.dart' as _i17;
import '../../../application/editor/cv_editor_bloc.dart' as _i3;
import '../../../application/navigation/navigation_bloc.dart' as _i12;
import '../../../domain/auth/i_auth_facade.dart' as _i7;
import '../../../domain/desing.dart' as _i11;
import '../../../domain/i_desings.dart' as _i15;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i8;
import '../../../infrastructure/core/register_module.dart' as _i19;
import '../../../infrastructure/in_memory_desings.dart' as _i16;
import '../routes/navigators/custom_navigator.dart' as _i10;
import '../routes/navigators/i_navigator.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.CveditorBloc>(() => _i3.CveditorBloc());
  gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i5.GlobalKey<_i5.NavigatorState>>(() => registerModule.key);
  gh.lazySingleton<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(() =>
      _i8.FirebaseAuthFacade(get<_i4.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.factory<_i9.INavigator>(
      () => _i10.CustomNavigator(get<_i5.GlobalKey<_i5.NavigatorState>>()));
  gh.lazySingleton<List<_i11.Desing>>(() => registerModule.desings);
  gh.factory<_i12.NavigationBloc>(
      () => _i12.NavigationBloc(get<_i9.INavigator>()));
  gh.factory<_i13.SignInFormBloc>(
      () => _i13.SignInFormBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i7.IAuthFacade>()));
  gh.lazySingleton<_i15.IDesings>(
      () => _i16.InMemoryDesings(get<List<_i11.Desing>>()));
  gh.factory<_i17.DesingDetailsBloc>(
      () => _i17.DesingDetailsBloc(get<_i15.IDesings>()));
  gh.factory<_i18.DesingsBloc>(() => _i18.DesingsBloc(get<_i15.IDesings>()));
  return get;
}

class _$RegisterModule extends _i19.RegisterModule {}
