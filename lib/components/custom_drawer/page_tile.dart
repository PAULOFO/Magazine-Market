import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  const PageTile({this.label,
    this.iconData,
    this.onTap,
    this.highlighted,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: highlighted ? Colors.redAccent : Colors.black54,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.redAccent : Colors.black54,
      ),
      onTap: onTap,
     // contentPadding: const EdgeInsets.all(8),
    );
    //highlighted: h
  }
}
