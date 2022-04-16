import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:faker/faker.dart';

class DesingMother {
  static Desing random() => Desing(
        id: faker.randomGenerator.integer(1000),
        reference: faker.guid.toString(),
        fileName: faker.randomGenerator.string(10),
        category: faker.randomGenerator.element(Category.values),
        price: faker.randomGenerator.decimal(),
      );
}
