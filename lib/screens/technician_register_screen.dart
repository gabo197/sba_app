import 'package:flutter/material.dart';
import '../components/components.dart';
import 'screens.dart';

class TechnicianRegisterScreen extends StatelessWidget {
  const TechnicianRegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Registro",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: "Nombre",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.email,
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.phone,
              hintText: "Teléfono",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.map,
              hintText: "Distrito",
              onChanged: (value) {},
            ),
            //DropDownButton(),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Continuar",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
