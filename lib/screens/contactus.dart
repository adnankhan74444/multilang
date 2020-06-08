import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../drawer.dart';

class ContactUs extends StatelessWidget {
  static const String routeName = '/contactUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('ContactUs')),

      ),
      drawer: AppDrawer(),

    );
  }
}
