import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryBlue = Color.fromARGB(255, 0, 126, 230);
  static const Color primaryBlack = Colors.black;
  static const Color backgroundColor = Colors.white;
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black87;
  static const Color borderColor = Colors.grey;
  
  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryBlue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 14),
  );
  
  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryBlack,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 14),
  );
  
  
  static TextStyle titleLarge = GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: textPrimary,
  );
  
  static TextStyle titleMedium = GoogleFonts.raleway(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static TextStyle priceStyle = GoogleFonts.raleway(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: textPrimary,
  );
  
  static TextStyle bodyText = GoogleFonts.nunitoSans(
    fontSize: 14,
    color: textSecondary,
  );
  
  
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );
  
  static BoxDecoration tagDecoration = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(8),
  );
  
  
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 12.0;
  static const double spacingLarge = 20.0;
  static const double spacingXLarge = 40.0;
}