import 'package:flutter/material.dart';
import 'package:multilang/extra/app_assets.dart';
import 'package:multilang/extra/app_strings.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class Otp extends StatefulWidget {
  static const String routeName = '/otp';

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    startTimer();
  }

  /// get signature code
  _getSignatureCode() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("signature $signature");
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Verification OTP Code $_otpCode Success")));
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppAssets.PepsiLogo),
            SizedBox(
              height: 10,
            ),
            Text(AppStrings.OTP),
            SizedBox(
              height: 20,
            ),
            Text("$_start"),
            SizedBox(
              height: 20,
            ),
            TextFieldPin(
              filled: true,
              filledColor: Colors.white,
              codeLength: _otpCodeLength,
              boxSize: 46,
              filledAfterTextChange: false,
              textStyle: TextStyle(fontSize: 16),
              borderStyle: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5)),
              onOtpCallback: (code, isAutofill) =>
                  _onOtpCallBack(code, isAutofill),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: MaterialButton(
                    onPressed: _enableButton ? _onSubmitOtp : null,
                    child: _setUpButtonChild(),
                    color: Colors.blue,
                    disabledColor: Colors.blue[100],
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: _enableButton ? _onSubmitOtp : null,
                    child: _setUpResendButtonChild(),
                    color: Colors.blue,
                    disabledColor: Colors.blue[100],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      print("Hello");
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }

  Widget _setUpResendButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Resend",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
