import 'package:flutter/material.dart';

/// String extensions for all the strings used in the app
extension RCStrings on BuildContext {
  /// Current Locale variable
  Locale get currentLocale => Localizations.localeOf(this);

  /// Get the string from the strings file according to the language
  String string(RCStringDetail detail) {
    return currentLocale.languageCode == 'en'
        ? detail.english
        : (detail.french ?? detail.english);
  }
}

/// To get string of overall app
class RCStringDetail {
  /// To get string of English language
  final String english;

  /// To get string of French language
  final String? french;

  /// String details constructor
  RCStringDetail({
    required this.english,
    this.french,
  });
}

/// To get string of Hello There text
RCStringDetail get tvHelloThere => RCStringDetail(
      english: 'Hello there',
      french: 'Bonjour',
    );

/// To get string of App Bar Title
RCStringDetail get tvAppBarTitle => RCStringDetail(
      english: 'Random Color Generator',
    );
