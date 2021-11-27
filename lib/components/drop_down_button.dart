import 'package:flutter/material.dart';
import '../sba_theme.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<String?>? onChanged;

  @override
  State<DropDownButton> createState() => _DropDownButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownButton extends State<DropDownButton> {
  String dropdownValue = 'Ancón';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kLightLPrimaryColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            widget.icon,
            color: kDarkPrimaryColor,
          ),
          hintText: widget.hintText,
        ),
        value: dropdownValue,
        onChanged: widget.onChanged,
        items: <String>[
          'Ancón',
          'Ate',
          'Barranco',
          'Breña',
          'Carabayllo',
          'Chaclacayo',
          'Chorrillos',
          'Cieneguilla',
          'Comas',
          'El Agustino'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
