import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sba_app/navigation/app_link.dart';
import 'package:sba_app/screens/screens.dart';
import '../components/components.dart';
import 'package:sba_app/sba_theme.dart';

import '../models/models.dart';
import '../network/authentication.dart';

class LoginScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.loginPath,
      key: ValueKey(SbaPages.loginPath),
      child: const LoginScreen(),
    );
  }

  final String? email;

  const LoginScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color rwColor = Colors.blue;

  final TextStyle focusedStyle = const TextStyle(color: Colors.blue);

  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  Future<UserAuth>? _futureUser;

  @override
  Widget build(BuildContext context) {
    var email = "";
    var password = "";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (_futureUser == null)
            ? SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Iniciar Sesión",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 300,
                    child: SvgPicture.asset('assets/images/login.svg'),
                  ),
                  const SizedBox(height: 8),
                  RoundedInputField(
                    icon: Icons.email,
                    hintText: "Email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  RoundedButton(
                    text: "Iniciar sesión",
                    press: () {
                      setState(() {
                        _futureUser = attemptLogin(email, password);
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  //Sized
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: kDarkPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿No tienes una cuenta? ",
                        style: const TextStyle(
                          color: kDarkPrimaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerRegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Regístrate",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))
            : buildFutureBuilder(),
      ),
    );
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );

  FutureBuilder<UserAuth> buildFutureBuilder() {
    return FutureBuilder<UserAuth>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.token == null) {
            SchedulerBinding.instance!.addPostFrameCallback((_) => setState(() {
                  _futureUser = null;
                  displayDialog(
                      context, 'Oops!', 'Correo y/o contraseña equivocado/s');
                }));
          } else {
            Provider.of<AppStateManager>(context, listen: false)
                .login('mockUsername', 'mockPassword');
          }
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
