import 'package:flutter/material.dart';

class FractalizeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const FractalizeAppBar({
    super.key,
    required this.title,
    this.hasInfoButton = true,
  });
  final String title;
  final bool hasInfoButton;

  @override
  State<FractalizeAppBar> createState() => _FractalizeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FractalizeAppBarState extends State<FractalizeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.indigoAccent,
      leading:
          Navigator.of(context).canPop()
              ? IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,

      actions:
          widget.hasInfoButton
              ? [
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    // TODO: open a dialog with info about the page.
                  },
                ),
              ]
              : null,
      actionsIconTheme: IconThemeData(color: Colors.white),
    );
  }
}
