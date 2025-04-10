import 'package:flutter/material.dart';

const darkTheme = ColorScheme.dark(
  secondary: Color(0xFF121212), // Dark grey background
  tertiary: Color(0xFF1E1E1E), // Slightly lighter surface
  onSecondary: Colors.white, // Text color on background
  primary: Colors.blueGrey, // AppBar/primary color
);

const lightTheme = ColorScheme.light(
  secondary: Color(0xFFF5F5F5), // Light grey background
  tertiary: Color(0xFFE0E0E0), // Slightly darker surface
  onSecondary: Colors.black87, // Text color on background
  primary: Colors.blue, // AppBar/primary color
); 
AppBarTheme getAppBarTheme(bool isDark) {
  return AppBarTheme(
    backgroundColor: isDark
        ? const Color(0xFF121212) // Dark background
        : const Color.fromARGB(255, 255, 255, 255), // Light background
    elevation: 0,
    iconTheme: IconThemeData(
      color: isDark ? Colors.white : Colors.black87,
    ),
    titleTextStyle: TextStyle(
      color: isDark ? Colors.white : Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
