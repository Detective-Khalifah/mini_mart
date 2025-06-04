import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.route,
  });

  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => route != null
            ? Navigator.of(context).popAndPushNamed(route!)
            : Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
      title: Text(title),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
