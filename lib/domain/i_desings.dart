import 'package:cv_desing_website_flutter/domain/desing.dart';

abstract class IDesings {
  Future<Desing> getByReference(String reference);
}
