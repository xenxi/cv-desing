import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/cv_desing_app.dart';
import 'dart:js' as js;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  js.context["FIREBASE_API_KEY"] =
      const String.fromEnvironment("FIREBASE_API_KEY");
  js.context["FIREBASE_AUTH_DOMAIN"] =
      const String.fromEnvironment("FIREBASE_AUTH_DOMAIN");
  js.context["FIREBASE_PROJECT_ID"] =
      const String.fromEnvironment("FIREBASE_PROJECT_ID");
  js.context["FIREBASE_STORAGE_BUCKET"] =
      const String.fromEnvironment("FIREBASE_STORAGE_BUCKET");
  js.context["FIREBASE_MESSAGING_SENDER_ID"] =
      const String.fromEnvironment("FIREBASE_MESSAGING_SENDER_ID");
  js.context["FIREBASE_APP_ID"] =
      const String.fromEnvironment("FIREBASE_APP_ID");
  js.context["FIREBASE_MEASUREMENT_ID"] =
      const String.fromEnvironment("FIREBASE_MEASUREMENT_ID");

  runApp(const CvDesingApp());
}
