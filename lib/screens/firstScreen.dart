import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multilang/AppLanguage.dart';
import 'package:multilang/extra/app_assets.dart';
import 'package:multilang/extra/app_strings.dart';
import 'dart:io' show Platform;

import 'package:multilang/routes/Routes.dart';
import 'package:provider/provider.dart';



class LanguageSelector extends StatefulWidget {
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool _lights = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.BackgroundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.PepsiLogo),
            Text(_lights
                ? AppStrings.English_SelectALanguage
                : AppStrings.Arabic_SelectALanguage),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.Arabic),
                switchWidget(context),
                Text(AppStrings.English),
              ],
            ),
            onTapButton(context)
          ],
        ),
      ),
    );
  }

  ///////////// Switch Widget////////////
  Widget switchWidget(BuildContext context) {
    return Platform.isAndroid
        ? Switch(
            value: _lights,
            onChanged: (bool value) => languageSwitcher(value),
          )
        : CupertinoSwitch(
            value: _lights, onChanged: (bool value) => languageSwitcher(value));
  }

  languageSwitcher(value) {
    setState(() {
      _lights = value;
    });
  }

  ///////////// Go Button Widget////////////
  Widget onTapButton(
    BuildContext context,
  ) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 30, top: 50),
      child: Column(
        children: [
          Material(
            elevation: 2.0,
            color: Colors.red,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                appLanguage.changeLanguage(Locale(_lights ? "en" : "ar"));
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              child: Text(
                _lights ? AppStrings.English_Go : AppStrings.Arabic_Go,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
