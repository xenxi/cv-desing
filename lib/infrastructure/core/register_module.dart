import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/desing_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/example_resume_data.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @singleton
  GlobalKey<NavigatorState> get key => GlobalKey<NavigatorState>();
  @lazySingleton
  List<Desing> get desings => DesingData.desings;

  @lazySingleton
  @preResolve
  Future<ExampleResumeData> get demoResume async {
    final bytes = await rootBundle.load(ImagePath.jonDoe);
    final avatar = bytes.buffer.asUint8List();
    return ExampleResumeData(avatar: avatar);
  }
}
