import 'package:driver/generated/l10n.dart';
import 'package:driver/modles/constant_colors.dart';
import 'package:driver/mywigets/my_home_page.dart';
import 'package:driver/providers/language_provider.dart';
import 'package:driver/providers/theme_mode_provider.dart';
import 'package:driver/screens/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = const FlutterSecureStorage();
  final String? isRegistered = await storage.read(key: 'token');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeModeProvider()),
      ],
      child: MyApp(isRegistered: isRegistered != null),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isRegistered;

  const MyApp({super.key, required this.isRegistered});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale:
          (context.watch<LanguageProvider>().language == 'ar')
              ? const Locale('ar')
              : const Locale('en'),
      theme: ThemeData(
        fontFamily: 'CascadiaMono',
        primaryColor: Colors.white70,
        primaryColorDark: Colors.white,
        primaryColorLight: Colors.black,
        searchBarTheme: SearchBarThemeData(
          backgroundColor: WidgetStateProperty.all(
            ConstantColors.appBarColorLight,
          ),
        ),
        //cardColor: Colors.white,
        // listTileTheme: ListTileThemeData(
        //   tileColor: Colors.white,
        // ),
        appBarTheme: const AppBarTheme(color: ConstantColors.appBarColorLight),
        scaffoldBackgroundColor: ConstantColors.ScaffoldBackgroundColorLight,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ConstantColors.backgroundOfRequestsBlock,
        ),
      ),

      // darkTheme: ThemeData.dark().copyWith(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: ConstantColors.appBarColorDark),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'CascadiaMono'),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ConstantColors.backgroundOfRequestsBlock,
        ),
      ),
      //     ThemeData(
      //   fontFamily: 'CascadiaMono',

      //   primaryColor: Colors.blueGrey,
      //   primaryColorDark: ConstantColors.DrawerBackgroundColorDark,
      //   primaryColorLight: Colors.white,
      //   //cardColor: Colors.black,
      //   // listTileTheme: ListTileThemeData(
      //   //   tileColor: Colors.black,
      //   // ),
      //   appBarTheme: const AppBarTheme(color: ConstantColors.appBarColorDark),
      //   scaffoldBackgroundColor: ConstantColors.ScaffoldBackgroundColorDark,
      // ),
      themeMode:
          (context.watch<ThemeModeProvider>().isDark == true)
              ? ThemeMode.dark
              : ThemeMode.light,
      home: (widget.isRegistered) ? const MyHomePage() : const LogIn(),
    );
  }
}
