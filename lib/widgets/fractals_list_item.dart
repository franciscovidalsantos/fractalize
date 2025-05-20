import 'package:flutter/material.dart';

class FractalsListItem extends StatelessWidget {
  const FractalsListItem({
    super.key,
    required this.index,
    required this.label,
    required this.isEnabled,
  });
  final bool isEnabled;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(label),
          // subtitle: Text("Description $index"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          enabled: isEnabled,
        ),
      ],
    );
  }
}
