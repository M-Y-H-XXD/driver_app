// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `language`
  String get language {
    return Intl.message('language', name: 'language', desc: '', args: []);
  }

  /// `log out`
  String get sign_out {
    return Intl.message('log out', name: 'sign_out', desc: '', args: []);
  }

  /// `choose language`
  String get choose_language {
    return Intl.message(
      'choose language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Current Mission`
  String get current_mission {
    return Intl.message(
      'Current Mission',
      name: 'current_mission',
      desc: '',
      args: [],
    );
  }

  /// `next mission`
  String get next_mission {
    return Intl.message(
      'next mission',
      name: 'next_mission',
      desc: '',
      args: [],
    );
  }

  /// `your status is`
  String get your_status_is {
    return Intl.message(
      'your status is',
      name: 'your_status_is',
      desc: '',
      args: [],
    );
  }

  /// `finish mission`
  String get finish_mission {
    return Intl.message(
      'finish mission',
      name: 'finish_mission',
      desc: '',
      args: [],
    );
  }

  /// `new mission`
  String get new_mission {
    return Intl.message('new mission', name: 'new_mission', desc: '', args: []);
  }

  /// `from`
  String get from {
    return Intl.message('from', name: 'from', desc: '', args: []);
  }

  /// `to`
  String get to {
    return Intl.message('to', name: 'to', desc: '', args: []);
  }

  /// `source details`
  String get source_details {
    return Intl.message(
      'source details',
      name: 'source_details',
      desc: '',
      args: [],
    );
  }

  /// `destination details`
  String get destination_details {
    return Intl.message(
      'destination details',
      name: 'destination_details',
      desc: '',
      args: [],
    );
  }

  /// `date of receiving`
  String get date_of_receiving {
    return Intl.message(
      'date of receiving',
      name: 'date_of_receiving',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
