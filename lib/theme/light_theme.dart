part of 'theme.dart';

final _lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppTheme.color.sendColor,
    brightness: Brightness.light,
    error: AppTheme.color.errorColor,
    primary: AppTheme.color.primaryColor,
    secondary: AppTheme.color.secondaryColor,
    primaryContainer: AppTheme.color.primaryColor.withOpacity(0.4),
    secondaryContainer: AppTheme.color.secondaryColor.withOpacity(0.4),
    errorContainer: AppTheme.color.errorColor.withOpacity(0.4),
    background: AppTheme.color.backgroundColor,
  ),
  brightness: Brightness.light,
  typography: Typography(),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return AppTheme.color.idealColor;
        }
        return AppTheme.color.primaryColor;
      }),
      elevation: 14.cl(18, 28).all,
      shadowColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.transparent;
        }
        return AppTheme.color.primaryColor.withOpacity(0.5);
      }),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.roboto(
          fontSize: 16.cl(14, 20),
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStatePropertyAll(
        AppTheme.color.backgroundColor.withOpacity(0.1),
      ),
      padding: MaterialStatePropertyAll(
        20.cl(16, 28).pdX.copyWith(
              top: 16.cl(14, 28),
              bottom: 16.cl(14, 28),
            ),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.cl(8, 16),
          ),
        ),
      ),
    ),
  ),
  textTheme: TextTheme(
    // Display
    displayLarge: GoogleFonts.inter(
      fontSize: 34.cl(24, 58),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 30.cl(22, 50),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 26.cl(30, 40),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    // Title
    titleLarge: GoogleFonts.roboto(
      fontSize: 16.cl(14, 24),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 14.cl(12, 20),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 12.cl(10, 16),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    // Headline
    headlineLarge: GoogleFonts.roboto(
      fontSize: 18.cl(18, 36),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 16.cl(16, 22),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 14.cl(14, 18),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    // Body
    bodyLarge: GoogleFonts.inter(
      fontSize: 18.cl(18, 26),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16.cl(16, 22),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 14.cl(10, 18),
      fontWeight: FontWeight.w400,
      color: AppTheme.color.textColor,
    ),
    // Label
    labelLarge: GoogleFonts.inter(
      fontSize: 16.cl(16, 24),
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 14.cl(14, 20),
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10.cl(9, 16),
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.cl(4, 10)),
      side: BorderSide(
        width: 4.sp,
        style: BorderStyle.solid,
        color: AppTheme.color.secondaryColor,
      ),
    ),
    side: BorderSide(
      width: 4.sp,
      style: BorderStyle.solid,
      color: AppTheme.color.secondaryColor,
    ),
    checkColor: MaterialStatePropertyAll(AppTheme.color.secondaryColor),
    overlayColor:
        MaterialStatePropertyAll(AppTheme.color.secondaryColor.withOpacity(.4)),
    fillColor: const MaterialStatePropertyAll(Colors.transparent),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 20.cl(20, 40),
      vertical: 16.cl(14, 22),
    ),
    labelStyle: GoogleFonts.inter(
      fontSize: 16.cl(14, 24),
      fontWeight: FontWeight.w700,
      color: AppTheme.color.textColor,
    ),
    hintStyle: GoogleFonts.inter(
      fontSize: 16.cl(16, 22),
      fontWeight: FontWeight.w500,
      color: AppTheme.color.secondaryTextColor,
    ),
    prefixIconColor: AppTheme.color.primaryColor,
    suffixIconColor: AppTheme.color.primaryColor,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.cl(10, 20)),
      borderSide: BorderSide(
        width: 6.cl(3, 6),
        style: BorderStyle.solid,
        color: AppTheme.color.errorColor,
      ),
    ),
    errorMaxLines: 2,
    focusColor: AppTheme.color.primaryColor,
    iconColor: Colors.grey[900],
    filled: true,
    fillColor: const Color(0xffF5F6FA),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.cl(10, 20)),
      borderSide: BorderSide(
        width: 6.cl(3, 6),
        style: BorderStyle.solid,
        color: const Color(0xffF5F6FA),
      ),
    ),
    activeIndicatorBorder: BorderSide(
      width: 6.cl(3, 6),
      style: BorderStyle.solid,
      color: AppTheme.color.primaryColor,
    ),
    outlineBorder: BorderSide(
      width: 6.cl(3, 6),
      style: BorderStyle.solid,
      color: const Color(0xffF5F6FA),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.cl(10, 20)),
      borderSide: BorderSide(
        width: 6.cl(3, 6),
        style: BorderStyle.solid,
        color: AppTheme.color.primaryColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.cl(10, 20)),
      borderSide: BorderSide(
        width: 6.cl(3, 6),
        style: BorderStyle.solid,
        color: const Color(0xffF5F6FA),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.cl(10, 20)),
      borderSide: BorderSide(
        width: 6.cl(3, 6),
        style: BorderStyle.solid,
        color: const Color(0xffF5F6FA),
      ),
    ),
  ),
);
