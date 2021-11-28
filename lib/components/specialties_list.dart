import 'package:flutter/material.dart';
import 'package:sba_app/network/specialty_model.dart';
import 'package:sba_app/sba_theme.dart';

class SpecialtiesList extends StatefulWidget {
  const SpecialtiesList({
    Key? key,
    required this.specialties,
  }) : super(key: key);

  final List<Specialty> specialties;

  @override
  _SpecialtiesListState createState() => _SpecialtiesListState();
}

class SelectedSpecialties {
  static List<Specialty> selectedSpecialties = [];
}

class _SpecialtiesListState extends State<SpecialtiesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: specialtyWidgets.toList(),
        ),
      ],
    );
  }

  Iterable<Widget> get specialtyWidgets sync* {
    for (Specialty specialty in widget.specialties) {
      yield Padding(
        padding: const EdgeInsets.all(6),
        child: FilterChip(
          labelPadding: EdgeInsets.all(7.0),
          avatar: CircleAvatar(
            backgroundColor: kDarkPrimaryColor,
            child: (specialty.name == "Gasfitería")
                ? Icon(Icons.water_outlined)
                : (specialty.name == "Electricista")
                    ? Icon(Icons.lightbulb_outline)
                    : (specialty.name == "Jardinería")
                        ? Icon(Icons.water_damage_outlined)
                        : (specialty.name == "Pintura")
                            ? Icon(Icons.format_paint_outlined)
                            : (specialty.name == "Limpieza")
                                ? Icon(Icons.cleaning_services_outlined)
                                : (specialty.name == "Desinfección")
                                    ? Icon(Icons.clean_hands_outlined)
                                    : (specialty.name == "Cerrajería")
                                        ? Icon(Icons.vpn_key_outlined)
                                        : (specialty.name == "Instalaciones")
                                            ? Icon(Icons.build_circle_outlined)
                                            : (specialty.name == "Albaliñería")
                                                ? Icon(Icons.wallpaper_outlined)
                                                : (specialty.name ==
                                                        "Carpintería")
                                                    ? Icon(Icons
                                                        .carpenter_outlined)
                                                    : (specialty.name ==
                                                            "Electrodomésticos")
                                                        ? Icon(Icons
                                                            .maps_home_work_outlined)
                                                        : Text(specialty.name[0]
                                                            .toUpperCase()),
          ),
          label: Text(specialty.name),
          selected: SelectedSpecialties.selectedSpecialties.contains(specialty),
          backgroundColor: kLightLPrimaryColor,
          selectedColor: kPrimaryColor,
          elevation: 3,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                SelectedSpecialties.selectedSpecialties.add(specialty);
              } else {
                SelectedSpecialties.selectedSpecialties
                    .removeWhere((Specialty spec) {
                  return spec == specialty;
                });
              }
            });
          },
        ),
      );
    }
  }
}
