import "package:flutter/material.dart";

class PersistentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PersistentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 84,
      leading: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          padding: const EdgeInsets.all(8),
          // margin: const EdgeInsets.all(8),
          child: Text(
            "Full Logo",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Color(0xFF2563EB),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "DELIVERY ADDRESS",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
          ),
          Text(
            "Umuezike Road, Oyo State",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
