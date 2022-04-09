import 'package:cv_desing_website_flutter/presentation/core/routes/navigators/i_navigator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: INavigator)
class CustomNavigator implements INavigator {
  CustomNavigator(this.key);
  final GlobalKey<NavigatorState> key;

  @override
  Future<void> navigateTo(String routeName) =>
      key.currentState!.pushNamed(routeName);

  @override
  Future<void> goBack() {
    key.currentState!.pop();
    return Future.value();
  }
}
