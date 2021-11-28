import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sba_app/components/info.dart';
import 'package:sba_app/models/models.dart';
import '../components/components.dart';

class TechnicianProfileScreen extends StatefulWidget {
  const TechnicianProfileScreen({Key? key}) : super(key: key);

  @override
  State<TechnicianProfileScreen> createState() =>
      _TechnicianProfileScreenState();
}

class _TechnicianProfileScreenState extends State<TechnicianProfileScreen> {
  bool editMode = false;
  @override
  Widget build(BuildContext context) {
    var name = "";
    var email = "";
    var telefono = "";
    var district = "";

    return Scaffold(
      body: Container(
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
              RoundedInputFieldEdit(
                hintText: "Nombre",
                icon: Icons.person,
                enabled: (editMode == false) ? false : true,
                onChanged: (value) {
                  name = value;
                },
              ),
              RoundedInputFieldEdit(
                hintText: "Email",
                icon: Icons.email,
                enabled: (editMode == false) ? false : true,
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedInputFieldEdit(
                hintText: "Teléfono",
                icon: Icons.phone,
                enabled: (editMode == false) ? false : true,
                onChanged: (value) {
                  telefono = value;
                },
              ),
              DropDownButton(
                icon: Icons.map,
                hintText: "Distrito",
                onChanged: (editMode == false)
                    ? null
                    : (value) {
                        district = value!;
                      },
              ),
              const SizedBox(height: 8),
              const Text(
                "Ajustes",
              ),
              const SizedBox(height: 8),
              (editMode == false)
                  ? RoundedButton(
                      text: "Editar perfil",
                      press: () {
                        setState(() {
                          editMode = true;
                        });
                      })
                  : RoundedButton(
                      text: "Aceptar",
                      press: () {
                        setState(() {
                          editMode = false;
                        });
                      }),
              RoundedButton(text: "Cambiar especialidades", press: () {}),
              RoundedButton(text: "Cambiar contraseña", press: () {}),
              RoundedButton(
                  text: "Cerrar sesión",
                  press: () {
                    // 1
                    Provider.of<ProfileManager>(context, listen: false)
                        .tapOnProfile(false);
                    // 2
                    Provider.of<AppStateManager>(context, listen: false)
                        .logout();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
