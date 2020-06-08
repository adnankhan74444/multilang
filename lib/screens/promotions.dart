import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../drawer.dart';

class Promotions extends StatelessWidget {
  static const String routeName = '/promotions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('Promotions')),
      ),
      drawer: AppDrawer(),
    );
  }
}
