import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sba_app/components/info.dart';
import 'package:sba_app/sba_theme.dart';
import '../components/components.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = "";
    var email = "";
    var telefono = "";
    var distrito = "";

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Info(
              image: "assets/images/Yuppies - Remote from Living Room.png",
              name: "Laura Torres",
            ),
            Text(
              "Distrito: La Molina",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29)),
                      child: Text(
                        "Whatsapp",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2.0, color: kPrimaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29))),
                      child: Text(
                        "Escribir opinion",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29)),
                      child: Text(
                        "Reportar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Descripción",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod  tempor invidunt ut labore et dolore magna aliquyam erat.sed diam voluptua. ",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Especialidades",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    ChipForRow(label: 'Limpieza', color: Colors.redAccent),
                    ChipForRow(label: 'Pintura', color: Colors.orangeAccent),
                    ChipForRow(label: 'Desinfección', color: Colors.blueAccent),
                    ChipForRow(label: 'Cerrajería', color: Colors.lightGreen),
                    ChipForRow(label: 'Gasfitería', color: Colors.pinkAccent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
