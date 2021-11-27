import 'package:flutter/material.dart';
import 'text_field_container.dart';
import '../sba_theme.dart';

class RoundedInputFieldEdit extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool enabled;

  const RoundedInputFieldEdit({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kDarkPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
