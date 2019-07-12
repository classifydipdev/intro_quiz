import 'dart:async';

import 'package:classify/presentation/utils/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeLocalization(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appName {
    return Intl.message('Classify', name: 'app_name');
  }

  String get forStudents {
    return Intl.message('for students; by students', name: 'forStudents');
  }

  String get signUpWithEmail {
    return Intl.message('Sign up with email', name: 'signUpWithEmail');
  }

  String get signUp {
    return Intl.message('sign up', name: 'signUp');
  }

  String get signIn {
    return Intl.message('sign in', name: 'signIn');
  }

  String get logIn {
    return Intl.message('Log in', name: 'logIn');
  }

  String get privacyPolicy {
    return Intl.message(
        'By clicking sign up, you agree to our terms of use, \nprivacy policy and disclaimer',
        name: 'privacyPolicy');
  }

  String get switchAccount {
    return Intl.message('switch account', name: 'switchAccount');
  }

  String get email {
    return Intl.message('email', name: 'email');
  }

  String get password {
    return Intl.message('password', name: 'password');
  }

  String get navigationButtonNext {
    return Intl.message('Next', name: 'navigation_next');
  }

  String get navigationButtonBack {
    return Intl.message('Back', name: 'navigation_back');
  }

  String get navigationButtonSave {
    return Intl.message('Save', name: 'navigation_save');
  }

  String get error {
    return Intl.message('Error!', name: 'error');
  }

  String get subjects {
    return Intl.message('Subjects', name: 'sublects');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
