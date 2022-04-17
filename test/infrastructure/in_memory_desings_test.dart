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
    late Desing anyFlyer;
    late InMemoryDesings desings;
    setUp(() {
      anyBussinesCard = DesingMother.random(category: Category.businessCard);
      anyCurriculum = DesingMother.random(category: Category.curriculum);
      anyFlyer = DesingMother.random(category: Category.flyer);
      desings = InMemoryDesings([anyBussinesCard, anyCurriculum, anyFlyer]);
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
    test('search bussines cards', () async {
      final result = await desings.search(category: Category.businessCard);

      expect(result.getOrElse(() => []), [anyBussinesCard]);
    });
    test('search flyers', () async {
      final result = await desings.search(category: Category.flyer);

      expect(result.getOrElse(() => []), [anyFlyer]);
    });
    test('return failure when not found desing by reference', () async {
      final result = await desings.getByReference('unknownReference');

      expect(result, const Left(DesingNotFound('unknownReference')));
    });
  });
}
