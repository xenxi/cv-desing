import 'package:flutter/material.dart';

bool isMobileScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < 720;
