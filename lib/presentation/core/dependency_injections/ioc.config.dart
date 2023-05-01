// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth/auth_bloc.dart' as _i21;
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart' as _i20;
import '../../../application/components/image_picker.dart' as _i15;
import '../../../application/desings/desings_bloc.dart' as _i26;
import '../../../application/desings/details/desing_details_bloc.dart' as _i25;
import '../../../application/editor/academy_training_form/academy_training_form_bloc.dart'
    as _i3;
import '../../../application/editor/complementary_training_form/complementary_training_form_bloc.dart'
    as _i4;
import '../../../application/editor/contact_information_form/contact_information_form_bloc.dart'
    as _i5;
import '../../../application/editor/cv_editor_actor/cv_editor_actor_bloc.dart'
    as _i6;
import '../../../application/editor/cv_editor_bloc.dart' as _i22;
import '../../../application/editor/personal_information_form/personal_information_form_bloc.dart'
    as _i19;
import '../../../application/navigation/navigation_bloc.dart' as _i18;
import '../../../domain/auth/i_auth_facade.dart' as _i11;
import '../../../domain/desing.dart' as _i17;
import '../../../domain/i_desings.dart' as _i23;
import '../../../infrastructure/auth/firebase_auth_facade.dart' as _i12;
import '../../../infrastructure/core/register_module.dart' as _i27;
import '../../../infrastructure/file_picker_image_picker.dart' as _i16;
import '../../../infrastructure/in_memory_desings.dart' as _i24;
import '../../shared/values/example_resume_data.dart' as _i7;
import '../routes/navigators/custom_navigator.dart' as _i14;
import '../routes/navigators/i_navigator.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AcademyTrainingFormBloc>(() => _i3.AcademyTrainingFormBloc());
  gh.factory<_i4.ComplementaryTrainingFormBloc>(
      () => _i4.ComplementaryTrainingFormBloc());
  gh.singleton<_i5.ContactInformationFormBloc>(
      _i5.ContactInformationFormBloc());
  gh.factory<_i6.CvEditorActorBloc>(() => _i6.CvEditorActorBloc());
  await gh.lazySingletonAsync<_i7.ExampleResumeData>(
    () => registerModule.demoResume,
    preResolve: true,
  );
  gh.lazySingleton<_i8.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.singleton<_i9.GlobalKey<_i9.NavigatorState>>(registerModule.key);
  gh.lazySingleton<_i10.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i11.IAuthFacade>(() => _i12.FirebaseAuthFacade(
        get<_i8.FirebaseAuth>(),
        get<_i10.GoogleSignIn>(),
      ));
  gh.factory<_i13.INavigator>(
      () => _i14.CustomNavigator(get<_i9.GlobalKey<_i9.NavigatorState>>()));
  gh.factory<_i15.ImagePicker>(() => _i16.FilePickerImagePicker());
  gh.lazySingleton<List<_i17.Desing>>(() => registerModule.desings);
  gh.factory<_i18.NavigationBloc>(
      () => _i18.NavigationBloc(get<_i13.INavigator>()));
  gh.singleton<_i19.PersonalInformationFormBloc>(
      _i19.PersonalInformationFormBloc(get<_i15.ImagePicker>()));
  gh.factory<_i20.SignInFormBloc>(
      () => _i20.SignInFormBloc(get<_i11.IAuthFacade>()));
  gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(get<_i11.IAuthFacade>()));
  gh.factory<_i22.CvEditorBloc>(() => _i22.CvEditorBloc(
        get<_i5.ContactInformationFormBloc>(),
        get<_i19.PersonalInformationFormBloc>(),
      ));
  gh.lazySingleton<_i23.IDesings>(
      () => _i24.InMemoryDesings(get<List<_i17.Desing>>()));
  gh.factory<_i25.DesingDetailsBloc>(
      () => _i25.DesingDetailsBloc(get<_i23.IDesings>()));
  gh.factory<_i26.DesingsBloc>(() => _i26.DesingsBloc(get<_i23.IDesings>()));
  return get;
}

class _$RegisterModule extends _i27.RegisterModule {}
