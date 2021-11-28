import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sba_app/components/specialties_list.dart';
import 'package:sba_app/network/specialty_model.dart';
import 'package:sba_app/network/specialty_service.dart';
import 'package:sba_app/network/technician_service.dart';
import 'package:sba_app/screens/screens.dart';
import '../components/components.dart';
import 'package:http/http.dart' as http;
import '../sba_theme.dart';
import '../models/models.dart';

class ChooseSpecialtyScreen extends StatefulWidget {
  @override
  ChooseSpecialtyScreen({Key? key, this.userId, this.email, this.password})
      : super(key: key);

  int? userId;
  String? email;
  String? password;

  @override
  State<ChooseSpecialtyScreen> createState() => _ChooseSpecialtyScreenState();
}

class _ChooseSpecialtyScreenState extends State<ChooseSpecialtyScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Specialty> selected = [];

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: SpecialtyService().fetchSpecialties(http.Client()),
      builder: (context, AsyncSnapshot<List<Specialty>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            body: (selected.isEmpty)
                ? Container(
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
                          SpecialtiesList(
                            specialties: snapshot.data!,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          RoundedButton(
                            text: "Continuar",
                            press: () {
                              setState(() {
                                selected =
                                    SelectedSpecialties.selectedSpecialties;
                              });
                              //Navigator.push(
                              //  context,
                              //  MaterialPageRoute(
                              //   builder: (context) => WelcomeScreen(),
                              //  ),
                              //);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                        ],
                      ),
                    ),
                  )
                : assignTechnicianSpecialty(0),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  FutureBuilder<Specialty> assignTechnicianSpecialty(int i) {
    return FutureBuilder<Specialty>(
      future: TechnicianService()
          .assignTechnicianSpecialty(widget.userId!, selected[i].id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SchedulerBinding.instance!.addPostFrameCallback((_) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(
                    email: widget.email,
                    password: widget.password,
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
