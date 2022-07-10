// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i20;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i19;
import '../../../application/components/image_picker.dart' as _i14;
import '../../../application/desings/desings_bloc.dart' as _i24;
import '../../../application/desings/details/desing_details_bloc.dart' as _i23;
import '../../../application/editor/academy_training_form/academy_training_form_bloc.dart'
    as _i3;
import '../../../application/editor/complementary_training_form/complementary_training_form_bloc.dart'
    as _i4;
import '../../../application/editor/contact_information_form/contact_information_form_bloc.dart'
    as _i5;
import '../../../application/editor/cv_editor_bloc.dart' as _i6;
import '../../../application/editor/personal_information_form/personal_information_form_bloc.dart'
    as _i18;
import '../../../application/navigation/navigation_bloc.dart' as _i17;
import '../../../domain/auth/i_auth_facade.dart' as _i10;
import '../../../domain/desing.dart' as _i16;
import '../../../domain/i_desings.dart' as _i21;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i11;
import '../../../infrastructure/core/register_module.dart' as _i25;
import '../../../infrastructure/file_picker_image_picker.dart' as _i15;
import '../../../infrastructure/in_memory_desings.dart' as _i22;
import '../routes/navigators/custom_navigator.dart' as _i13;
import '../routes/navigators/i_navigator.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AcademyTrainingFormBloc>(() => _i3.AcademyTrainingFormBloc());
  gh.factory<_i4.ComplementaryTrainingFormBloc>(
      () => _i4.ComplementaryTrainingFormBloc());
  gh.factory<_i5.ContactInformationFormBloc>(
      () => _i5.ContactInformationFormBloc());
  gh.factory<_i6.CvEditorBloc>(
      () => _i6.CvEditorBloc(get<_i5.ContactInformationFormBloc>()));
  gh.lazySingleton<_i7.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i8.GlobalKey<_i8.NavigatorState>>(() => registerModule.key);
  gh.lazySingleton<_i9.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i10.IAuthFacade>(() => _i11.FirebaseAuthFacade(
      get<_i7.FirebaseAuth>(), get<_i9.GoogleSignIn>()));
  gh.factory<_i12.INavigator>(
      () => _i13.CustomNavigator(get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i14.ImagePicker>(() => _i15.FilePickerImagePicker());
  gh.lazySingleton<List<_i16.Desing>>(() => registerModule.desings);
  gh.factory<_i17.NavigationBloc>(
      () => _i17.NavigationBloc(get<_i12.INavigator>()));
  gh.factory<_i18.PersonalInformationFormBloc>(
      () => _i18.PersonalInformationFormBloc(get<_i14.ImagePicker>()));
  gh.factory<_i19.SignInFormBloc>(
      () => _i19.SignInFormBloc(get<_i10.IAuthFacade>()));
  gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(get<_i10.IAuthFacade>()));
  gh.lazySingleton<_i21.IDesings>(
      () => _i22.InMemoryDesings(get<List<_i16.Desing>>()));
  gh.factory<_i23.DesingDetailsBloc>(
      () => _i23.DesingDetailsBloc(get<_i21.IDesings>()));
  gh.factory<_i24.DesingsBloc>(() => _i24.DesingsBloc(get<_i21.IDesings>()));
  return get;
}

class _$RegisterModule extends _i25.RegisterModule {}
