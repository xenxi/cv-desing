import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';

class DesingFailure extends Failure<Unit> {
  const DesingFailure() : super(unit);
}

class DesingNotFound extends DesingFailure {
  const DesingNotFound();
}
