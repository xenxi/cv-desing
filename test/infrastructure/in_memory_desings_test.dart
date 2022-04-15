import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/desing_failures.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/infrastructure/in_memory_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InMemoryDesings should', () {
    test('found desing by reference', () async {
      const anyDesing = Desing(
        id: 1,
        reference: 'anyReference',
        fileName: 'anyFileName',
        category: Category.curriculum,
        price: 1,
      );
      final desings = InMemoryDesings([anyDesing]);

      final result = await desings.getByReference(anyDesing.reference);

      expect(result, const Right(anyDesing));
    });
    test('search by reference case insensitive', () async {
      const anyDesing = Desing(
        id: 1,
        reference: 'anyReference',
        fileName: 'anyFileName',
        category: Category.curriculum,
        price: 1,
      );
      final desings = InMemoryDesings([anyDesing]);

      final result =
          await desings.getByReference(anyDesing.reference.toUpperCase());

      expect(result, const Right(anyDesing));
    });
    test('return failure when not found desing by reference', () async {
      const anyDesing = Desing(
        id: 1,
        reference: 'anyReference',
        fileName: 'anyFileName',
        category: Category.curriculum,
        price: 1,
      );
      final desings = InMemoryDesings([anyDesing]);

      final result = await desings.getByReference('unknownReference');

      expect(result, const Left(DesingNotFound('unknownReference')));
    });
  });
}
