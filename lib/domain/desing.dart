import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';

import 'category.dart';

class Desing {
  Desing({
    required this.id,
    required this.reference,
    required String fileName,
    required this.category,
    required this.price,
    this.priceWithDiscount,
  }) : _fileName = fileName;

  final int id;
  final String reference;
  final String _fileName;
  final Category category;
  final double price;
  final double? priceWithDiscount;

  String thumbnail() => '${ImagePath.desingsThumbnailDir}/xs_$_fileName';
  String image() => '${ImagePath.desingsDir}/$_fileName';
}
