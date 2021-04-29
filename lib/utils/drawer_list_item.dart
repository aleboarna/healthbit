import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final IconData icon;

  const DrawerListItem(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: onTap,
    );
  }
}
