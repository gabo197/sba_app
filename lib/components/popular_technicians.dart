import 'package:flutter/material.dart';
import 'package:sba_app/network/technician_model.dart';

class TechniciansList extends StatelessWidget {
  const TechniciansList({Key? key, required this.technicians})
      : super(key: key);

  final List<Technician> technicians;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mejores técnicos',
                style: Theme.of(context).textTheme.headline3,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Ver más",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          height: 140,
          color: Colors.transparent,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 6);
            },
            itemCount: technicians.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(index.toString()))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            '${technicians[index].imageUrl}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, object, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${technicians[index].firstName} ${technicians[index].lastName}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${technicians[index].phoneNumber}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
