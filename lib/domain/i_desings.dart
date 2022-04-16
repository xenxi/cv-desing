import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IDesings {
  Future<Either<Failure, Desing>> getByReference(String reference);

  Future<Either<Failure, List<Desing>>> search({required Category category});
}
