import 'package:flutter/material.dart';

class FetchLoadingPage extends Page {
  const FetchLoadingPage() : super(key: const ValueKey('FetchLoadingPage'));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionDuration: const Duration(seconds: 0),
        opaque: false,
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              body: const Center(child: CircularProgressIndicator()));
        });
  }
}
