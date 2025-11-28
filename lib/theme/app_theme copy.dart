// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../constants/app_colors.dart';

// class AppTheme {
//     AppTheme._();

// // Common Colors
//   static const Color primary = Color(0xFFFFD700);
//   static const Color secondary = Color(0xFF94073c);
//   static const Color darkPrimary = Color(0xFF94073c);
//   static const Color lightPrimary = Color(0xFFff9baf);
//   static const Color lighterPrimary = Color(0xFFffc8d3);
//   static const Color lightestPrimary = Color(0xFFffe1e6);
//   static const Color extraLightestPrimary = Color(0xFFfff0f2);
//   static const Color white = Color(0xFFFFFFFF);
//   static const Color black = Color(0xFF000000);
//   static const Color bgColor = Color(0xFFF4F4F4); // softer white
//   // static const Color bgColor = Color(0xFFF8FAFC); // softer white

//   // Greys
//   static const Color grey = Color(0xFF9F9F9F); // base grey
//   static const Color lightGrey = Color(0xFFD6D6D6);
//   static const Color lighterGrey = Color(0xFFEFEFEF);
//   static const Color extraLightGrey = Color(0xFFF8F8F8);
//   static const Color darkGrey = Color(0xFF616161);
//   static const Color textGrey = Color(0xFF8F8F8F);
//   static const Color borderGrey = Color(0xFFDDDDDD);
//   static const Color hintTextGrey = Color(0xFFAFAFAF);
//   static const Color iconGrey = Color(0xFFB0B0B0);

//   // Greens
//   static const Color lightGreen = Color(0xFFC8E6C9);
//   static const Color successGreen = Color(0xFF008000);
//   static const Color confirmGreen = Color(0xFF43A047);
//   static const Color accentGreen = Color(0xFF66BB6A);
//   static const Color gold = Color(0xFFFDD017);
//   static const Color transparent = Color(0x00000000);
//   // Reds
//   static const Color lightRed = Color(0xFFFFCDD2);
//   static const Color darkRed = Color(0xFFD32F2F);
//   static const Color errorRed = Color(0xFFB00020);
//   static const Color alertRed = Color(0xFFE53935);

//   // Light Theme Colors
//   static const Color lightBackground = Color(0xFFF5F5F5);
//   static const Color lightText = Color(0xFF000000);

//   // Dark Theme Colors
//   static const Color darkBackground = Color(0xFF121212);
//   static const Color darkText = Color(0xFFFFFFFF);



//   static ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.bgColor,
//     primaryColor: AppColors.primary,
//     fontFamily: "Poppins",

//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColors.white,
//       iconTheme: IconThemeData(color: AppColors.black),
//       titleTextStyle: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: AppColors.black,
//       ),
//     ),

//     dividerColor: AppColors.borderGrey,

//     textTheme: const TextTheme(
//       bodyLarge: TextStyle(color: AppColors.black),
//       bodyMedium: TextStyle(color: AppColors.textGrey),
//       titleLarge: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: AppColors.black,
//       ),
//     ),

//     iconTheme: const IconThemeData(color: AppColors.iconGrey),

//     /// Buttons
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor:
//             WidgetStatePropertyAll<Color>(AppColors.secondary),
//         foregroundColor:
//             WidgetStatePropertyAll<Color>(AppColors.white),
//         shape: WidgetStatePropertyAll(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//       ),
//     ),

//     /// Chip / Tags
//     chipTheme: ChipThemeData(
//       backgroundColor: AppColors.lightestPrimary,
//       selectedColor: AppColors.primary,
//       labelStyle: const TextStyle(color: AppColors.black),
//     ),

//     /// TextField / Input design
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.white,
//       hintStyle: const TextStyle(color: AppColors.hintTextGrey),
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 12,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.borderGrey),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.borderGrey),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.darkPrimary),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.errorRed),
//       ),
//     ),
//   );
  
// static ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.bgColor,
//     primaryColor: AppColors.primary,
//     cardColor: AppColors.white,
//     dividerColor: AppColors.lightestPrimary,

//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: AppColors.secondary,
//       onPrimary: AppColors.white,
//       secondary: AppColors.primary,
//       onSecondary: AppColors.black,
//       surface: AppColors.white,
//       onSurface: AppColors.black,
//       tertiary: AppColors.lightPrimary,
//     ),

//     // App Bar
//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.white,
//       elevation: 0,
//       iconTheme: const IconThemeData(color: AppColors.secondary),
//       titleTextStyle: GoogleFonts.inter(
//         color: AppColors.black,
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//       ),
//     ),

//     // Card Theme
//     // cardTheme: CardTheme(
//     //   color: AppColors.white,
//     //   elevation: 2,
//     //   shape: RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.circular(12),
//     //   ),
//     //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     // ),

//     // Buttons
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.secondary,
//         foregroundColor: AppColors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         textStyle: GoogleFonts.inter(
//           fontWeight: FontWeight.w600,
//           fontSize: 16,
//         ),
//       ),
//     ),

//     outlinedButtonTheme: OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(
//         foregroundColor: AppColors.secondary,
//         side: const BorderSide(color: AppColors.secondary, width: 1.5),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         textStyle: GoogleFonts.inter(
//           fontSize: 15,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ),

//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: AppColors.secondary,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         textStyle: GoogleFonts.inter(
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ),

//     // Text theme
//     textTheme: _textTheme(),

//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.white,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.lightestPrimary),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.lightestPrimary),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.secondary, width: 2),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       hintStyle: GoogleFonts.inter(
//         color: AppColors.black.withOpacity(0.45),
//       ),
//     ),
//   );

//   // ----------------------------------------------------------------

//   /// DARK THEME
//   static ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: AppColors.darkPrimary,
//     primaryColor: AppColors.primary,
//     cardColor: AppColors.secondary,
//     dividerColor: AppColors.lightPrimary.withOpacity(0.2),

//     colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: AppColors.primary,
//       onPrimary: AppColors.black,
//       secondary: AppColors.lightPrimary,
//       onSecondary: AppColors.black,
//       surface: AppColors.darkPrimary,
//       onSurface: AppColors.white,
//       tertiary: AppColors.lighterPrimary,
//       error: Colors.red,
//     ),

//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.darkPrimary,
//       elevation: 0,
//       iconTheme: const IconThemeData(color: AppColors.white),
//       titleTextStyle: GoogleFonts.inter(
//         color: AppColors.white,
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//       ),
//     ),

//     // cardTheme: CardTheme(
//     //   color: AppColors.secondary,
//     //   elevation: 3,
//     //   shape: RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.circular(12),
//     //   ),
//     // ),

//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primary,
//         foregroundColor: AppColors.black,
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     ),

//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: AppColors.primary,
//       ),
//     ),

//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.lightPrimary.withOpacity(.1),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.lightPrimary),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(
//           color: AppColors.primary,
//           width: 2,
//         ),
//       ),
//       hintStyle: GoogleFonts.inter(
//         color: AppColors.white.withOpacity(.5),
//       ),
//     ),
//     textTheme: _textTheme(isDark: true),
//   );

//   // ----------------------------------------------------------------

//   static TextTheme _textTheme({bool isDark = false}) {
//     final Color primaryText = isDark ? AppColors.white : AppColors.black;
//     final Color secondaryText =
//         isDark ? AppColors.lighterPrimary : AppColors.secondary.withOpacity(.6);

//     return TextTheme(
//       headlineLarge: GoogleFonts.inter(
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//         color: primaryText,
//       ),
//       headlineMedium: GoogleFonts.inter(
//         fontSize: 26,
//         fontWeight: FontWeight.w600,
//         color: primaryText,
//       ),
//       titleMedium: GoogleFonts.inter(
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//         color: primaryText,
//       ),
//       titleSmall: GoogleFonts.inter(
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//         color: primaryText,
//       ),
         





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that contains all theme configurations for the cryptocurrency application.
class AppTheme {
  AppTheme._();
  // dark theme colors
  static const Color primaryDark = Color(0xFF1A1B23); // Deep background
  static const Color secondaryDark = Color(0xFF2A2D3A); // Card surfaces
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB8BCC8);
  static const Color borderSubtleDark = Color(0xFF3A3D4A);
  static const Color surfaceElevatedDark = Color(0xFF252831);
  static const Color errorRedDark = Color(0xFFFF6B6B);
  static const Color shadowColorDark = Color(0x1A000000);
  static const Color elevatedShadowColorDark = Color(0x1A000000);
  static const Color greenDark = Color(0xFF068C06);


  // light theme colors
  static const Color primaryLight = Color(0xFFFAFAFB); // Clean light background
  static const Color secondaryLight = Color(0xFFFFFFFF); // Pure white card surfaces
  static const Color accentTeal = Color(0xFF455bff); // Main accent - Modern blue
  static const Color accentSecondry = Color(0xFFdde8ff);
  static const Color accentTherd = Color(0xFFecf3ff);
  static const Color warningOrange = Color(0xFFFF6B35); // Warm gold for warnings
  static const Color successGreen = Color(0xFF00C896); // Fresh success green
  static const Color green = Color(0xFF068C06); // Fresh success green
  static const Color textPrimary = Color(0xFF111827); // Dark text for contrast
  static const Color textSecondary = Color(0xFF6B7280); // Medium gray supporting text
  static const Color borderSubtle = Color(0xFFD6D8DC); // Light gray borders
  static const Color hintTextColor = Color(0xFFC9CACD);
  static const Color surfaceElevated = Color(0xFFFFFFFF); // White elevated surfaces
  static const Color errorRed = Color(0xFFEF4444); // Clean error red
  static const Color shadowColor = Color(0x1A000000); // Subtle light shadow
  static const Color elevatedShadowColor = Color(0x1A000000);
  static const Color black = Color(0xFF000000);

  // Brand gradient colors
  static const LinearGradient brandGradient = LinearGradient(
    colors: [accentTeal, accentTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Dark theme optimized for cryptocurrency applications
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: accentTeal,
      onPrimary: primaryLight,
      primaryContainer: accentTeal.withAlpha(51),
      onPrimaryContainer: textPrimary,
      secondary: successGreen,
      onSecondary: primaryLight,
      secondaryContainer: successGreen.withAlpha(51),
      onSecondaryContainer: textPrimary,
      tertiary: warningOrange,
      onTertiary: textPrimary,
      tertiaryContainer: warningOrange.withAlpha(51),
      onTertiaryContainer: textPrimary,
      error: errorRed,
      onError: textPrimary,
      surface: primaryLight,
      onSurface: textPrimary,
      onSurfaceVariant: textSecondary,
      outline: borderSubtle,
      outlineVariant: borderSubtle.withAlpha(128),
      shadow: shadowColor,
      scrim: primaryLight.withAlpha(204),
      inverseSurface: textPrimary,
      onInverseSurface: primaryLight,
      inversePrimary: accentTeal,
    ),
    scaffoldBackgroundColor: primaryLight,
    cardColor: secondaryLight,
    dividerColor: borderSubtle,

    // AppBar theme for secure, professional appearance
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
      foregroundColor: textPrimary,
      elevation: 0,
      shadowColor: elevatedShadowColor,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(
        color: textPrimary,
        size: 24,
      ),
      actionsIconTheme: const IconThemeData(
        color: textPrimary,
        size: 24,
      ),
    ),

    // Card theme with subtle elevation
    cardTheme: CardThemeData(
      color: secondaryLight,
      elevation: 2.0,
      shadowColor: elevatedShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Bottom navigation optimized for crypto operations
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceElevated,
      selectedItemColor: accentTeal,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Floating action button for primary crypto actions
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentTeal,
      foregroundColor: primaryLight,
      elevation: 4,
      focusElevation: 6,
      hoverElevation: 6,
      highlightElevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // Button themes for financial operations
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryLight,
        backgroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 2,
        shadowColor: elevatedShadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: const BorderSide(color: accentTeal, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
        ),
      ),
    ),

    // Typography optimized for financial data
    textTheme: _buildCryptoTextTheme(),

    // Input decoration for secure form fields
    inputDecorationTheme: InputDecorationTheme(
      fillColor: secondaryLight,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: borderSubtle, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: borderSubtle, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: accentTeal, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: errorRed, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: errorRed, width: 2),
      ),
      labelStyle: GoogleFonts.inter(
        color: textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textSecondary.withAlpha(179),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: textSecondary,
      suffixIconColor: textSecondary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    // Switch theme for settings
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentTeal;
        }
        return textSecondary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentTeal.withAlpha(77);
        }
        return borderSubtle;
      }),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentTeal;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(primaryLight),
      side: const BorderSide(color: borderSubtle, width: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // Radio theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return accentTeal;
        }
        return borderSubtle;
      }),
    ),

    // Progress indicator for blockchain operations
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentTeal,
      linearTrackColor: borderSubtle,
      circularTrackColor: borderSubtle,
    ),

    // Slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: accentTeal,
      thumbColor: accentTeal,
      overlayColor: accentTeal.withAlpha(51),
      inactiveTrackColor: borderSubtle,
      valueIndicatorColor: accentTeal,
      valueIndicatorTextStyle: GoogleFonts.inter(
        color: primaryLight,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Tab bar theme
    tabBarTheme: TabBarThemeData(
      labelColor: accentTeal,
      unselectedLabelColor: textSecondary,
      indicatorColor: accentTeal,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
    ),

    // Tooltip theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textStyle: GoogleFonts.inter(
        color: textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // Snackbar theme for notifications
    snackBarTheme: SnackBarThemeData(
      backgroundColor: surfaceElevated,
      contentTextStyle: GoogleFonts.inter(
        color: textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: accentTeal,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: surfaceElevated,
      elevation: 8,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: GoogleFonts.inter(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      contentTextStyle: GoogleFonts.inter(
        color: textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
    ),

    // Bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: surfaceElevated,
      elevation: 8,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),

    // List tile theme
    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      selectedTileColor: accentTeal.withAlpha(26),
      iconColor: textSecondary,
      textColor: textPrimary,
      selectedColor: accentTeal,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: 0.15,
      ),
      subtitleTextStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        letterSpacing: 0.25,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );

  /// Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: accentTeal,
      onPrimary: textPrimaryDark,
      primaryContainer: accentTeal.withAlpha(51),
      onPrimaryContainer: textPrimaryDark,
      secondary: greenDark,
      onSecondary: textPrimaryDark,
      secondaryContainer: greenDark.withAlpha(51),
      onSecondaryContainer: textPrimaryDark,
      tertiary: warningOrange,
      onTertiary: textPrimaryDark,
      tertiaryContainer: warningOrange.withAlpha(51),
      onTertiaryContainer: textPrimaryDark,
      error: errorRedDark,
      onError: textPrimaryDark,
      surface: primaryDark,
      onSurface: textPrimaryDark,
      onSurfaceVariant: textSecondaryDark,
      outline: borderSubtleDark,
      outlineVariant: borderSubtleDark,
      shadow: shadowColorDark,
      scrim: primaryDark.withAlpha(204),
      inverseSurface: textPrimaryDark,
      onInverseSurface: primaryDark,
      inversePrimary: accentTeal,
    ),
    scaffoldBackgroundColor: primaryDark,
    cardColor: secondaryDark,
    dividerColor: borderSubtleDark,

    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark,
      foregroundColor: textPrimaryDark,
      elevation: 0,
      shadowColor: elevatedShadowColorDark,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimaryDark,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(
        color: textPrimaryDark,
        size: 24,
      ),
      actionsIconTheme: const IconThemeData(
        color: textPrimaryDark,
        size: 24,
      ),
    ),

    cardTheme: CardThemeData(
      color: secondaryDark,
      elevation: 2.0,
      shadowColor: elevatedShadowColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceElevatedDark,
      selectedItemColor: accentTeal,
      unselectedItemColor: textSecondaryDark,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentTeal,
      foregroundColor: primaryDark,
      elevation: 4,
      focusElevation: 6,
      hoverElevation: 6,
      highlightElevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryDark,
        backgroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 2,
        shadowColor: elevatedShadowColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: const BorderSide(color: accentTeal, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentTeal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25,
        ),
      ),
    ),

    textTheme: _buildCryptoTextTheme(isLight: false),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: surfaceElevatedDark,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: borderSubtleDark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: borderSubtleDark, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: accentTeal, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: errorRedDark, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: errorRedDark, width: 2),
      ),
      labelStyle: GoogleFonts.inter(color: textSecondaryDark, fontSize: 14),
      hintStyle: GoogleFonts.inter(color: textSecondaryDark, fontSize: 14),
      prefixIconColor: textSecondaryDark,
      suffixIconColor: textSecondaryDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
  );


  /// Helper method to build cryptocurrency-optimized text theme
  static TextTheme _buildCryptoTextTheme({bool isLight = false}) {
    final Color primaryTextColor = isLight ? primaryLight : textPrimary;
    final Color secondaryTextColor =
        isLight ? const Color(0xFF6B7280) : textSecondary;

    return TextTheme(
      // Display styles for large headings
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.22,
      ),

      // Headline styles for section headers
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.33,
      ),

      // Title styles for cards and components
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0.15,
        height: 1.50,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0.1,
        height: 1.43,
      ),

      // Body styles for main content
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
        letterSpacing: 0.5,
        height: 1.50,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
        letterSpacing: 0.4,
        height: 1.33,
      ),

      // Label styles for buttons and small text
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: secondaryTextColor,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );
  }

  /// Monospace text style for cryptocurrency addresses and data
  static TextStyle monoTextStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    bool isLight = false,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? (isLight ? primaryLight : textPrimary),
      letterSpacing: 0.25,
      height: 1.4,
    );
  }

  /// Custom box shadow for elevated surfaces
  static List<BoxShadow> get elevatedShadow => [
        BoxShadow(
          color: shadowColor,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  /// Custom box shadow for floating elements
  static List<BoxShadow> get floatingShadow => [
        BoxShadow(
          color: shadowColor,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  /// Glassmorphism effect for special components
  static BoxDecoration get glassmorphismDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderSubtle.withAlpha(51),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            surfaceElevated.withAlpha(204),
            secondaryLight.withAlpha(153),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      );
}
