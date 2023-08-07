import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/view/home/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Appcolor.appstatusbar,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Kheloo',
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('hi', 'IN'), // hindi
        // Add other supported locales here
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Set the initial locale here (optional)
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homewdget(),
    );
  }
}


