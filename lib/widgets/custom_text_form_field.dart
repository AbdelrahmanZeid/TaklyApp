import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.textInputType,
    super.key,
    required this.lable,
    this.suffixIcon,
    required this.obscureText,
     this.onPressed,
    required this.validator,
    required this.onSaved,
    this.myController, this.onChanged,
  });
  final String lable;
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;

  final String? Function(String? value) validator;
  final void Function(String? value) onSaved;
  final void Function(String? value)? onChanged;
  final TextEditingController? myController;
  final VoidCallback? onPressed;
  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: myController,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(
          lable,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
