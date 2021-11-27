import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
//import 'package:provider/provider.dart';
import 'package:sba_app/components/drop_down_button.dart';
import 'package:sba_app/models/models.dart';
import 'package:sba_app/network/address_model.dart';
import 'package:sba_app/network/address_service.dart';
import 'package:sba_app/network/customer_model.dart';
import 'package:sba_app/network/customer_service.dart';
import 'package:sba_app/network/user_model.dart';
import 'package:sba_app/network/user_service.dart';
import 'package:sba_app/screens/welcome_screen.dart';
import '../components/components.dart';
import 'screens.dart';

class CustomerRegisterScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.customerSignUpPath,
      key: ValueKey(SbaPages.customerSignUpPath),
      child: const CustomerRegisterScreen(),
    );
  }

  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  Future<APIUser>? _futureUser;
  Future<Customer>? _futureCustomer;
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
              _futureCustomer == null)
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    icon: Icons.house,
                    hintText: "Dirección completa",
                    onChanged: (value) {
                      fullAddress = value;
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      password = value;
                      print('$email, $password');
                    },
                  ),
                  RoundedButton(
                    text: "Regístrate",
                    press: () {
                      setState(() {
                        _futureUser = UserService()
                            .createUser(email, password, "Customer");
                      });
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
            )
          : (_futureUser != null &&
                  _futureAddress == null &&
                  _futureCustomer == null)
              ? buildFutureBuilderUser()
              : (_futureUser != null &&
                      _futureAddress != null &&
                      _futureCustomer == null)
                  ? buildFutureBuilderAddress()
                  : buildFutureBuilderCustomer(),
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
                _futureCustomer = CustomerService().createCustomer(
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

  FutureBuilder<Customer> buildFutureBuilderCustomer() {
    return FutureBuilder<Customer>(
      future: _futureCustomer,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SchedulerBinding.instance!.addPostFrameCallback((_) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(
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
