import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:faker/faker.dart';

class DesingMother {
  static Desing random({Category? category}) => Desing(
        id: faker.randomGenerator.integer(1000),
        reference: faker.guid.guid(),
        fileName: faker.randomGenerator.string(10),
        category: category ?? faker.randomGenerator.element(Category.values),
        price: faker.randomGenerator.decimal(),
      );
  static List<Desing> randoms({int max = 10}) {
    final desings = <Desing>[];
    for (var i = 0; i < faker.randomGenerator.integer(max); i++) {
      desings.add(random());
    }

    return desings;
  }
}
