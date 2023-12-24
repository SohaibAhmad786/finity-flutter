library app_theme;

import 'package:finity/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'colors.dart';

part 'light_theme.dart';

class AppTheme {
  AppTheme._();

  static final AppColor color = AppColor();
  static final theme = _lightTheme;
}
