import 'package:cv_desing_website_flutter/presentation/shared/values/image_path.dart';

import 'category.dart';

class Desing {
  final int id;
  final String reference;
  final String fileName;
  final Category category;

  Desing(
    this.id,
    this.reference,
    this.fileName,
    this.category,
  );

  String thumbnail() => '${ImagePath.curriculumsThumbnailDir}/$fileName';
  String image() => '${ImagePath.curriculumsDir}/$fileName';
}
