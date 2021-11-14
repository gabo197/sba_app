import 'package:flutter/material.dart';
import 'package:sba_app/models/models.dart';
import 'package:sba_app/screens/welcome_screen.dart';
import '../components/components.dart';
import 'screens.dart';

class CustomerRegisterScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.customerSignUpPath,
      key: ValueKey(SbaPages.customerSignUpPath),
      child: const CustomerRegisterScreen(),
    );
  }

  const CustomerRegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
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
                // DropDownButton(),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "Regístrate",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
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
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocialIcon(
                      iconSrc: "assets/icons/google-mas.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
