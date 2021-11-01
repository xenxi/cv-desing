import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';

import 'category.dart';

class Desing {
  final int id;
  final String reference;
  final String _fileName;
  final Category category;
  final double price;

  Desing(this.id, this.reference, this._fileName, this.category, this.price);

  String thumbnail() => '${ImagePath.desingsThumbnailDir}/xs_$_fileName';
  String image() => '${ImagePath.desingsDir}/$_fileName';
}
