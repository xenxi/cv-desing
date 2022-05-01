import 'package:cv_desing_website_flutter/domain/url.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.avatarUrl});

  final Url avatarUrl;
  @override
  List<Object?> get props => [avatarUrl];
}
