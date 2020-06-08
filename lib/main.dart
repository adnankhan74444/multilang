import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilang/routes/Routes.dart';
import 'package:multilang/screens/contactus.dart';
import 'package:multilang/screens/firstScreen.dart';
import 'package:multilang/screens/home.dart';
import 'package:multilang/screens/order.dart';
import 'package:multilang/screens/otp.dart';
import 'package:multilang/screens/promotions.dart';
import './AppLanguage.dart';
import 'app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp(
    appLanguage: appLanguage

  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      builder: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: LanguageSelector(),
          routes: {
            Routes.home: (context) => Home(),
            Routes.order: (context) => Order(),
            Routes.promotions: (context) => Promotions(),
            Routes.contactUs: (context) => ContactUs(),
            Routes.otp: (context) => Otp(),

          },
        );
      }),
    );
  }
}

