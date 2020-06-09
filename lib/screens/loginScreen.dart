import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multilang/extra/app_assets.dart';
import 'package:multilang/extra/app_strings.dart';
import 'package:multilang/extra/input_widget.dart';

import '../app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  TextEditingController _phoneNumber = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool _agreedToTOS = false;

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.BackgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: ListView(
        children: <Widget>[
          Image.asset(
            AppAssets.PepsiLogo,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                InputWidget.buildField(
                    context,
                    AppLocalizations.of(context).translate('Mobile'),
                    InputWidget.inputField(
                      context: context,
                      controller: _phoneNumber,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: Color(0xFF013F8A),
                          value: _agreedToTOS,
                          onChanged: (bool value) {
                            setState(() {
                              _agreedToTOS = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        AppStrings.TermsAndConditions,
                        style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onTapButton(context),

                //there
              ],
            ),
          ),
        ],
      ),
    ));
  }

  //Button Widget
  Widget onTapButton(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: [
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
