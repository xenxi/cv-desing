import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/desing_failures.dart';
import 'package:cv_desing_website_flutter/infrastructure/in_memory_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/desing_mother.dart';

void main() {
  group('InMemoryDesings should', () {
    late Desing anyDesing;
    late InMemoryDesings desings;
    setUp(() {
      anyDesing = DesingMother.random();
      desings = InMemoryDesings([anyDesing]);
    });
    test('found desing by reference', () async {
      final result = await desings.getByReference(anyDesing.reference);

      expect(result, Right(anyDesing));
    });
    test('search by reference case insensitive', () async {
      final result =
          await desings.getByReference(anyDesing.reference.toUpperCase());

      expect(result, Right(anyDesing));
    });
    test('return failure when not found desing by reference', () async {
      final result = await desings.getByReference('unknownReference');

      expect(result, const Left(DesingNotFound('unknownReference')));
    });
  });
}
