import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sba_app/screens/screens.dart';
import '../components/components.dart';
import '../sba_theme.dart';
import '../models/models.dart';

class ChooseSpecialtyScreen extends StatelessWidget {
  @override
  const ChooseSpecialtyScreen({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryLightColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/images/Yuppies - Bust (1).svg",
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Registro",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "Seleccione sus especialidades",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButtonWithIcon(
              text: "Pintura",
              icon: Icons.format_paint_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Desinfección",
              icon: Icons.clean_hands_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Electricista",
              icon: Icons.lightbulb_outline,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Cerrajería",
              icon: Icons.vpn_key_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Instalaciones",
              icon: Icons.build_circle_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Albañilería",
              icon: Icons.wallet_giftcard, //falta
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Limpieza",
              icon: Icons.cleaning_services_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Gasfitería",
              icon: Icons.water_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Carpintería",
              icon: Icons.carpenter_outlined,
              press: () {},
            ),
            RoundedButtonWithIcon(
              text: "Electrodomésticos",
              icon: Icons.home_work_outlined,
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "Regístrate",
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
              height: size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
