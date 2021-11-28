import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sba_app/components/components.dart';
import 'package:sba_app/models/models.dart';
import 'package:sba_app/screens/screens.dart';

import '../sba_theme.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreen();
}

class _ReportScreen extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    var old_password = "";

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
              "Reportar un incidente",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Describe tu experiencia",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    ));
  }
}
