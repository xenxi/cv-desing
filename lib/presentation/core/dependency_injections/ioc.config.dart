// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i15;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i14;
import '../../../application/desings/desings_bloc.dart' as _i19;
import '../../../application/desings/details/desing_details_bloc.dart' as _i18;
import '../../../application/editor/academy_training_form/academy_training_form_bloc.dart'
    as _i3;
import '../../../application/editor/cv_editor_bloc.dart' as _i4;
import '../../../application/navigation/navigation_bloc.dart' as _i13;
import '../../../domain/auth/i_auth_facade.dart' as _i8;
import '../../../domain/desing.dart' as _i12;
import '../../../domain/i_desings.dart' as _i16;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i9;
import '../../../infrastructure/core/register_module.dart' as _i20;
import '../../../infrastructure/in_memory_desings.dart' as _i17;
import '../routes/navigators/custom_navigator.dart' as _i11;
import '../routes/navigators/i_navigator.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AcademyTrainingFormBloc>(() => _i3.AcademyTrainingFormBloc());
  gh.factory<_i4.CvEditorBloc>(() => _i4.CvEditorBloc());
  gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i6.GlobalKey<_i6.NavigatorState>>(() => registerModule.key);
  gh.lazySingleton<_i7.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i8.IAuthFacade>(() =>
      _i9.FirebaseAuthFacade(get<_i5.FirebaseAuth>(), get<_i7.GoogleSignIn>()));
  gh.factory<_i10.INavigator>(
      () => _i11.CustomNavigator(get<_i6.GlobalKey<_i6.NavigatorState>>()));
  gh.lazySingleton<List<_i12.Desing>>(() => registerModule.desings);
  gh.factory<_i13.NavigationBloc>(
      () => _i13.NavigationBloc(get<_i10.INavigator>()));
  gh.factory<_i14.SignInFormBloc>(
      () => _i14.SignInFormBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(get<_i8.IAuthFacade>()));
  gh.lazySingleton<_i16.IDesings>(
      () => _i17.InMemoryDesings(get<List<_i12.Desing>>()));
  gh.factory<_i18.DesingDetailsBloc>(
      () => _i18.DesingDetailsBloc(get<_i16.IDesings>()));
  gh.factory<_i19.DesingsBloc>(() => _i19.DesingsBloc(get<_i16.IDesings>()));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}
