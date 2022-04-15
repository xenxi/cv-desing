import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/desing_failures.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDesings)
class InMemoryDesings implements IDesings {
  InMemoryDesings(this._desings);

  final List<Desing> _desings;
  @override
  Future<Either<Failure, Desing>> getByReference(String reference) {
    final desing = _desings.cast<Desing?>().firstWhere(
          (desing) => desing!.reference == reference,
          orElse: () => null,
        );

    return Future.value(
      optionOf(desing).fold(
        () => Left(DesingNotFound(reference)),
        (desing) => Right(desing),
      ),
    );
  }
}
