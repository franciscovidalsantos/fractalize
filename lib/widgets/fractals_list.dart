import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/widgets/fractals_list_item.dart';

List<FractalType> fractalTypes = FractalType.values;

class FractalsList extends StatelessWidget {
  const FractalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fractalTypes.length,
      itemBuilder: (context, index) {
        String label = fractalTypes[index].label;
        return Column(
          children: [
            FractalsListItem(index: index, label: label),
            // Add a divider between items except for the last one
            if (index != fractalTypes.length - 1)
              Divider(height: 2, indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
