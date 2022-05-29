// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i18;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i17;
import '../../../application/components/image_picker.dart' as _i13;
import '../../../application/desings/desings_bloc.dart' as _i22;
import '../../../application/desings/details/desing_details_bloc.dart' as _i21;
import '../../../application/editor/academy_training_form/academy_training_form_bloc.dart'
    as _i3;
import '../../../application/editor/complementary_training_form/complementary_training_form_bloc.dart'
    as _i4;
import '../../../application/editor/cv_editor_bloc.dart' as _i5;
import '../../../application/navigation/navigation_bloc.dart' as _i16;
import '../../../domain/auth/i_auth_facade.dart' as _i9;
import '../../../domain/desing.dart' as _i15;
import '../../../domain/i_desings.dart' as _i19;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i10;
import '../../../infrastructure/core/register_module.dart' as _i23;
import '../../../infrastructure/file_picker_image_picker.dart' as _i14;
import '../../../infrastructure/in_memory_desings.dart' as _i20;
import '../routes/navigators/custom_navigator.dart' as _i12;
import '../routes/navigators/i_navigator.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AcademyTrainingFormBloc>(() => _i3.AcademyTrainingFormBloc());
  gh.factory<_i4.ComplementaryTrainingFormBloc>(
      () => _i4.ComplementaryTrainingFormBloc());
  gh.factory<_i5.CvEditorBloc>(() => _i5.CvEditorBloc());
  gh.lazySingleton<_i6.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i7.GlobalKey<_i7.NavigatorState>>(() => registerModule.key);
  gh.lazySingleton<_i8.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i9.IAuthFacade>(() => _i10.FirebaseAuthFacade(
      get<_i6.FirebaseAuth>(), get<_i8.GoogleSignIn>()));
  gh.factory<_i11.INavigator>(
      () => _i12.CustomNavigator(get<_i7.GlobalKey<_i7.NavigatorState>>()));
  gh.factory<_i13.ImagePicker>(() => _i14.FilePickerImagePicker());
  gh.lazySingleton<List<_i15.Desing>>(() => registerModule.desings);
  gh.factory<_i16.NavigationBloc>(
      () => _i16.NavigationBloc(get<_i11.INavigator>()));
  gh.factory<_i17.SignInFormBloc>(
      () => _i17.SignInFormBloc(get<_i9.IAuthFacade>()));
  gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(get<_i9.IAuthFacade>()));
  gh.lazySingleton<_i19.IDesings>(
      () => _i20.InMemoryDesings(get<List<_i15.Desing>>()));
  gh.factory<_i21.DesingDetailsBloc>(
      () => _i21.DesingDetailsBloc(get<_i19.IDesings>()));
  gh.factory<_i22.DesingsBloc>(() => _i22.DesingsBloc(get<_i19.IDesings>()));
  return get;
}

class _$RegisterModule extends _i23.RegisterModule {}
