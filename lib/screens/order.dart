import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../drawer.dart';

class Order extends StatelessWidget {
  static const String routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('Order')),
      ),
      drawer: AppDrawer(),

    );
  }
}
