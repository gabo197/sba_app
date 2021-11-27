import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sba_app/network/technician_model.dart';
import 'package:sba_app/network/technician_service.dart';
import 'package:http/http.dart' as http;
import 'package:sba_app/sba_theme.dart';

import '../components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: TechnicianService().fetchTechnicians(http.Client()),
      builder: (context, AsyncSnapshot<List<Technician>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return Stack(children: [
            Container(
              height: size.height * .22,
              decoration: const BoxDecoration(color: kPrimaryLightColor),
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "¡Hola Dana!",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "¿Necesitas ayuda?",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Ingrese su distrito",
                              icon: SvgPicture.asset(
                                "assets/icons/loupe.svg",
                                height: size.height * 0.025,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const Categories(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              PopularSpecialty(),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TechniciansList(
                                technicians: snapshot.data!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
