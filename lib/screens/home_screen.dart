import 'package:flutter/material.dart';
import 'package:sba_app/network/technician_model.dart';
import 'package:sba_app/network/technician_service.dart';
import 'package:http/http.dart' as http;

import '../components/components.dart';
import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TechnicianService().fetchTechnicians(http.Client()),
      builder: (context, AsyncSnapshot<List<Technician>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return TechniciansList(technicians: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class TechniciansList extends StatelessWidget {
  const TechniciansList({Key? key, required this.technicians})
      : super(key: key);

  final List<Technician> technicians;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: technicians.length,
      itemBuilder: (context, index) {
        return Image.network('${technicians[3].imageUrl}', fit: BoxFit.cover);
      },
    );
  }
}
