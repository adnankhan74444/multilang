import 'package:flutter/material.dart';
import 'package:multilang/routes/Routes.dart';

import 'app_localizations.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person),
                    Text(AppLocalizations.of(context).translate('MyAccount')),
                  ],
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(AppLocalizations.of(context).translate('Home')),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.home)

          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(AppLocalizations.of(context).translate('Order')),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.order)
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(AppLocalizations.of(context).translate('Promotions')),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.promotions)
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(AppLocalizations.of(context).translate('ContactUs')),
              onTap: () => Navigator.pushReplacementNamed(context, Routes.contactUs)
          ),
          SizedBox(
            height: 290,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppLocalizations.of(context).translate('Terms&Conditions')),
                Text("Terms & conditions"),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
