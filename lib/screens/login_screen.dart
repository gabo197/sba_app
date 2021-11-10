import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/components.dart';

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
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Iniciar Sesión"),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: SvgPicture.asset('assets/images/login.svg'),
                  ),
                  const SizedBox(height: 16),
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
                        Provider.of<AppStateManager>(context, listen: false)
                            .login('mockUsername', 'mockPassword');
                      });
                    },
                  )
                  //register
                ],
              )
            : buildFutureBuilder(),
      ),
    );
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  FutureBuilder<UserAuth> buildFutureBuilder() {
    return FutureBuilder<UserAuth>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data!.token == null)
              ? Text(snapshot.data!.message!)
              : Text(snapshot.data!.token!);
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
