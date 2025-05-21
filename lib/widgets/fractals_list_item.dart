import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/screens/fractal.dart';

class FractalsListItem extends StatelessWidget {
  const FractalsListItem({super.key, required this.fractalType});
  final FractalType fractalType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fractalType.info.label),
      // subtitle: Text("Description $index"),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      enabled: fractalType.info.isEnabled,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FractalScreen(fractalType: fractalType);
            },
          ),
        );
      },
    );
  }
}
