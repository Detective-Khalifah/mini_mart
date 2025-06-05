import 'package:flutter/material.dart';

class BlankPageWidget extends StatelessWidget {
  const BlankPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Blank Page"),
          onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        ),
      ),
    );
  }
}
