import 'package:flutter/material.dart';
import 'package:sba_app/components/info.dart';
import '../components/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = "";
    var email = "";
    var telefono = "";
    var distrito = "";

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Info(
              image: "assets/images/Yuppies - Remote from Living Room.png",
              name: "David Aguirre",
            ),
            const SizedBox(height: 8),
            const Text(
              "Mis datos",
              //style: SbaTheme.of(context),
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              hintText: "Nombre",
              icon: Icons.person,
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputField(
              hintText: "Email",
              icon: Icons.email,
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedInputField(
              hintText: "Teléfono",
              icon: Icons.phone,
              onChanged: (value) {
                telefono = value;
              },
            ),
            RoundedInputField(
              hintText: "Distrito",
              icon: Icons.map,
              onChanged: (value) {
                distrito = value;
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Ajustes",
            ),
            const SizedBox(height: 8),
            RoundedButton(text: "Cambiar especialidades", press: () {}),
            RoundedButton(text: "Cambiar contraseña", press: () {}),
            RoundedButton(text: "Cerrar sesión", press: () {})
          ],
        ),
      ),
    );
  }
}
