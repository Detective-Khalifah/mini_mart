import 'package:flutter/material.dart';
import 'package:mini_mart/widgets/notification_toast/notification_banner.dart';

class BannerOverlay extends StatefulWidget {
  final Widget child;

  const BannerOverlay({super.key, required this.child});

  static _BannerOverlayState? of(BuildContext context) {
    return context.findAncestorStateOfType<_BannerOverlayState>();
  }

  @override
  State<BannerOverlay> createState() => _BannerOverlayState();
}

class _BannerOverlayState extends State<BannerOverlay> {
  String? _message;
  bool _showBanner = false;

  void showBanner(String message) {
    setState(() {
      _message = message;
      _showBanner = true;
    });
  }

  void _hideBanner() {
    setState(() {
      _showBanner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_showBanner && _message != null)
          Positioned(
            top: 96,
            left: 8,
            right: 8,
            child: NotificationBanner(
              message: _message!,
              onDismiss: _hideBanner,
            ),
          ),
      ],
    );
  }
}
