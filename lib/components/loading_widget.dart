import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  bool isLoading;
  Widget child;
  LoadingWidget({
    required this.isLoading,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    } else {
      return child;
    }
  }
}
