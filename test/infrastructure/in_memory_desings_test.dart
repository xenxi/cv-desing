import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/desing_failures.dart';
import 'package:cv_desing_website_flutter/infrastructure/in_memory_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/desing_mother.dart';

void main() {
  group('InMemoryDesings should', () {
    late Desing anyBussinesCard;
    late Desing anyCurriculum;
    late InMemoryDesings desings;
    setUp(() {
      anyBussinesCard = DesingMother.random(category: Category.businessCard);
      anyCurriculum = DesingMother.random(category: Category.curriculum);
      desings = InMemoryDesings([anyBussinesCard, anyCurriculum]);
    });
    test('found desing by reference', () async {
      final result = await desings.getByReference(anyBussinesCard.reference);

      expect(result, Right(anyBussinesCard));
    });
    test('search by reference case insensitive', () async {
      final result =
          await desings.getByReference(anyBussinesCard.reference.toUpperCase());

      expect(result, Right(anyBussinesCard));
    });
    test('search curriculums', () async {
      final result = await desings.search(category: Category.curriculum);

      expect(result.getOrElse(() => []), [anyCurriculum]);
    });
    test('return failure when not found desing by reference', () async {
      final result = await desings.getByReference('unknownReference');

      expect(result, const Left(DesingNotFound('unknownReference')));
    });
  });
}
