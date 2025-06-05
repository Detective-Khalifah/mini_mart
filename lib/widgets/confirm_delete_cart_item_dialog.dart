import 'package:flutter/material.dart';

class ConfirmDeleteCartItemDialog extends StatelessWidget {
  const ConfirmDeleteCartItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remove Item?'),
      content: const Text('Confirm removal of this product from your cart.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(
            'Remove',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
