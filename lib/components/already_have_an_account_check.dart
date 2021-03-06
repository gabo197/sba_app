import 'package:flutter/material.dart';

import '../sba_theme.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No tienes una cuenta?" : "¿Ya tienes una cuenta?",
          style: const TextStyle(
            color: kDarkPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: () => press(),
          child: Text(
            login ? "Regístrate" : "Iniciar sesión",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
