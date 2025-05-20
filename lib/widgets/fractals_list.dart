import 'package:flutter/material.dart';
import 'package:fractalize/enums/fractal_type.dart';
import 'package:fractalize/widgets/fractals_list_item.dart';

class FractalsList extends StatelessWidget {
  const FractalsList({super.key});
  static final List<FractalType> fractalTypes = FractalType.values;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: fractalTypes.length,
      itemBuilder: (context, index) {
        final FractalTypeInfo itemInfo = fractalTypes[index].info;
        return FractalsListItem(
          index: index,
          label: itemInfo.label,
          isEnabled: itemInfo.isEnabled,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 2, indent: 16, endIndent: 16);
      },
    );
  }
}
