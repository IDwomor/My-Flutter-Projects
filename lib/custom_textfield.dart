import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureCharacter = '*',
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscuringCharacter: obscureCharacter,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),


      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 12.0),
        constraints: BoxConstraints(
          maxHeight: height * 0.065,
          maxWidth: width,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey,
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.lightBlue,
            width: 10.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.lightBlue,
            width: 1.0,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.lightBlue,
            width: 1.0,
          ),
        ),
      ),

    );
  }
}
