import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multilang/extra/border.dart';

class InputWidget {

 static OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: Colors.white));

  InputWidget._();
  static Widget buildField(
    BuildContext context,
    String title,
    Widget child,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              title,
              style: TextStyle(color: Colors.white)
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: child,
          ),
        ],
      );
  static Widget inputField({
    BuildContext context,
    String title,
    String hint,
    TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscureText = true,
    List<TextInputFormatter> inputText,
    Function(String) validator,
    Function onTap,
  }) =>
      TextFormField(
        style: TextStyle(fontSize: 20,color: Colors.white),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ? obscureText : false,
        inputFormatters: inputText,
        maxLines: 1,
        autofocus: false,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("+966 5 ",
                    style: TextStyle(
                        fontFamily: 'Poppins semiBold',
                        color: Colors.white,
                        fontSize: 20),
                    )
              ],
            ),
          ),
          contentPadding:
          EdgeInsets.only(top:19.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      );
}
