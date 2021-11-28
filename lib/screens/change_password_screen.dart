import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sba_app/components/components.dart';
import 'package:sba_app/models/models.dart';
import 'package:sba_app/screens/screens.dart';

import '../sba_theme.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var old_password = "";
    var new_password = "";
    var repeat_password = "";

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              "Cambiar Contraseña",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              icon: Icons.lock,
              hintText: "Contraseña anterior",
              onChanged: (value) {
                old_password = value;
              },
            ),
            RoundedInputField(
              icon: Icons.lock,
              hintText: "Nueva contraseña",
              onChanged: (value) {
                new_password = value;
              },
            ),
            RoundedInputField(
              icon: Icons.lock,
              hintText: "Repetir contraseña",
              onChanged: (value) {
                repeat_password = value;
              },
            ),
            RoundedButton(
              text: "Continuar",
              press: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
