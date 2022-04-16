import 'package:cv_desing_website_flutter/domain/desing_failures.dart';
import 'package:cv_desing_website_flutter/infrastructure/in_memory_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/desing_mother.dart';

void main() {
  group('InMemoryDesings should', () {
    test('found desing by reference', () async {
      final anyDesing = DesingMother.random();
      final desings = InMemoryDesings([anyDesing]);

      final result = await desings.getByReference(anyDesing.reference);

      expect(result, Right(anyDesing));
    });
    test('search by reference case insensitive', () async {
      final anyDesing = DesingMother.random();
      final desings = InMemoryDesings([anyDesing]);

      final result =
          await desings.getByReference(anyDesing.reference.toUpperCase());

      expect(result, Right(anyDesing));
    });
    test('return failure when not found desing by reference', () async {
      final anyDesing = DesingMother.random();
      final desings = InMemoryDesings([anyDesing]);

      final result = await desings.getByReference('unknownReference');

      expect(result, const Left(DesingNotFound('unknownReference')));
    });
  });
}
