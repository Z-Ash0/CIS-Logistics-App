import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

SizedBox verticalSpaceScreen(BuildContext context, double height) =>
    SizedBox(height: context.setBasedOnScreenHeight(height));
SizedBox horizontalSpaceScreen(BuildContext context, double width) =>
    SizedBox(width: context.setBasedOnScreenWidth(width));
