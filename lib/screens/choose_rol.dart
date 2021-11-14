import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sba_app/screens/customer_register_screen.dart';
import 'package:sba_app/screens/screens.dart';
import '../components/components.dart';
import '../sba_theme.dart';

class ChooseRolScreen extends StatelessWidget {
  const ChooseRolScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "¿Qué rol desea en la aplicación?",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SvgPicture.asset("assets/images/Options.svg",
              height: size.height * 0.55),
          const SizedBox(height: 24),
          //buildLoginButton(context),
          RoundedButton(
            text: "Contratar un servicio",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerRegisterScreen(),
                ),
              );
            },
          ),
          //buildRegisterButton(context),
          RoundedButton(
            text: "Ofrecer un servicio",
            color: kPrimaryColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TechnicianRegisterScreen(),
                  ));
            },
          ),
        ],
      ),
    ));
  }
}
