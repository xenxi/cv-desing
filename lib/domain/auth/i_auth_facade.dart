import 'package:cv_desing_website_flutter/domain/auth/value_objects/email_address.dart';
import 'package:cv_desing_website_flutter/domain/auth/value_objects/password.dart';

abstract class IAuthFacade {
  Future<void> registerWithEmailAndPassword(
      {required EmailAddress email, required Password password});
  Future<void> signInWithEmailAndPassword(
      {required EmailAddress email, required Password password});

  Future<void> signInWithGoogle();
}
