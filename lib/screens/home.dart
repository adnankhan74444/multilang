

import 'package:flutter/material.dart';
import 'package:multilang/routes/Routes.dart';

import '../AppLanguage.dart';
import '../app_localizations.dart';
import '../drawer.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('Home')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: InkWell(
                onTap: ()=>Navigator.pushReplacementNamed(context, Routes.login),
                child: Text("Hello")),)
          ],
        ),
      ),
    );
  }
}
