import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultTextField extends StatelessWidget {

     String? hintText;
     IconData? prefixIcon;
     IconData? suffixIcon;
     Function()? suffixOnPressed;
     bool obscure = false;
     Function(String value)? functionOnFieldSubmitted;
     TextEditingController? controller;
     TextInputType? textInputType;
     String? Function(String? value)? validatorMethod;
   DefaultTextField({
    required this.controller,
     required this.hintText,
     required this.textInputType,
     required this.validatorMethod,

  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      onFieldSubmitted: functionOnFieldSubmitted,
      keyboardType: textInputType,
      validator: validatorMethod,
      decoration: InputDecoration(
        hintText: hintText,

        border: InputBorder.none,
      ),
    );

  }
}
