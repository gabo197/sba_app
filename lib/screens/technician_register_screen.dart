import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sba_app/models/sba_pages.dart';
import 'package:sba_app/network/address_model.dart';
import 'package:sba_app/network/address_service.dart';
import 'package:sba_app/network/customer_model.dart';
import 'package:sba_app/network/customer_service.dart';
import 'package:sba_app/network/technician_model.dart';
import 'package:sba_app/network/technician_service.dart';
import 'package:sba_app/network/user_model.dart';
import 'package:sba_app/network/user_service.dart';
import '../components/components.dart';
import 'screens.dart';

class TechnicianRegisterScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.technicianSignUpPath,
      key: ValueKey(SbaPages.technicianSignUpPath),
      child: const TechnicianRegisterScreen(),
    );
  }

  const TechnicianRegisterScreen({Key? key}) : super(key: key);

  @override
  State<TechnicianRegisterScreen> createState() =>
      _TechnicianRegisterScreenState();
}

class _TechnicianRegisterScreenState extends State<TechnicianRegisterScreen> {
  Future<APIUser>? _futureUser;
  Future<Technician>? _futureTechnician;
  Future<Address>? _futureAddress;

  var userId = 0;
  var firstName = "";
  var lastName = "";
  var phoneNumber = "";
  var district = "Ancón";
  var fullAddress = "";
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: (_futureUser == null &&
              _futureAddress == null &&
              _futureTechnician == null)
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      onChanged: (value) {
                        firstName = value;
                      },
                    ),
                    RoundedInputField(
                      icon: Icons.person,
                      hintText: "Apellido",
                      onChanged: (value) {
                        lastName = value;
                      },
                    ),
                    RoundedInputField(
                      icon: Icons.email,
                      hintText: "Email",
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    RoundedInputField(
                      icon: Icons.phone,
                      hintText: "Teléfono",
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    DropDownButton(
                      icon: Icons.map,
                      hintText: "Distrito",
                      onChanged: (value) {
                        district = value!;
                      },
                    ),
                    RoundedInputField(
                      icon: Icons.home,
                      hintText: "Dirección",
                      onChanged: (value) {
                        fullAddress = value;
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    RoundedButton(
                      text: "Continuar",
                      press: () {
                        setState(() {
                          _futureUser = UserService()
                              .createUser(email, password, "Technician");
                        });
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
            )
          : (_futureUser != null &&
                  _futureAddress == null &&
                  _futureTechnician == null)
              ? buildFutureBuilderUser()
              : (_futureUser != null &&
                      _futureAddress != null &&
                      _futureTechnician == null)
                  ? buildFutureBuilderAddress()
                  : buildFutureBuilderTechnician(),
    );
  }

  FutureBuilder<APIUser> buildFutureBuilderUser() {
    return FutureBuilder<APIUser>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          userId = snapshot.data!.id;
          SchedulerBinding.instance!.addPostFrameCallback((_) => setState(() {
                _futureAddress = AddressService().createAddress(
                    "Lima", "Lima", district, fullAddress, userId);
              }));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  FutureBuilder<Address> buildFutureBuilderAddress() {
    return FutureBuilder<Address>(
      future: _futureAddress,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SchedulerBinding.instance!.addPostFrameCallback((_) => setState(() {
                _futureTechnician = TechnicianService().createTechnician(
                    firstName,
                    lastName,
                    "https://randomuser.me/api/portraits/lego/1.jpg",
                    "-",
                    phoneNumber,
                    userId);
              }));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  FutureBuilder<Technician> buildFutureBuilderTechnician() {
    return FutureBuilder<Technician>(
      future: _futureTechnician,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SchedulerBinding.instance!.addPostFrameCallback((_) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseSpecialtyScreen(
                    userId: userId,
                    email: email,
                    password: password,
                  ),
                ),
              ));
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
