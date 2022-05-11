import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

class UniqueId extends ValueObject<String> {
  const UniqueId._(this.value);
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }
  factory UniqueId.fromString(String uniqueId) => UniqueId._(
        right(uniqueId),
      );
  @override
  final Either<Failure<String>, String> value;
}
