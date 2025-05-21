import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/widgets/fractals_list_item.dart';

class FractalsList extends StatelessWidget {
  const FractalsList({super.key});
  static final List<FractalType> fractalTypes = FractalType.values;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: fractalTypes.length,
      itemBuilder: (context, index) {
        return FractalsListItem(fractalType: fractalTypes[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 0);
      },
    );
  }
}
