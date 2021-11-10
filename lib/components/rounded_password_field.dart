import 'package:flutter/material.dart';
import 'text_field_container.dart';
import '../sba_theme.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kDarkPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kDarkPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
