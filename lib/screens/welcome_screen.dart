import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sba_app/models/models.dart';
import 'package:sba_app/network/authentication.dart';
import '../components/components.dart';
import 'screens.dart';

class WelcomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.welcomePath,
      key: ValueKey(SbaPages.welcomePath),
      child: WelcomeScreen(),
    );
  }

  WelcomeScreen({Key? key, this.email, this.password}) : super(key: key);

  String? email;
  String? password;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<UserAuth>? _futureUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (_futureUser == null)
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "¡Bienvenido a SBA!",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 24),
                    SvgPicture.asset("assets/images/welcome.svg",
                        height: size.height * 0.55),
                    const SizedBox(height: 24),
                    Text(
                      " Ahora eres parte de la comunidad SBA. \nNosotros te ayudaremos.",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    RoundedButton(
                      text: "Siguiente",
                      press: () {
                        setState(() {
                          _futureUser =
                              attemptLogin(widget.email!, widget.password!);
                        });
                      },
                    ),
                  ],
                ),
              )
            : buildFutureBuilder(),
      ),
    );
  }

  FutureBuilder<UserAuth> buildFutureBuilder() {
    return FutureBuilder<UserAuth>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<AppStateManager>(context, listen: false)
              .login('mockUsername', 'mockPassword');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
