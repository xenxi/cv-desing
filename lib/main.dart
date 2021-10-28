import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/cv_desing_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const CvDesingApp());
}
