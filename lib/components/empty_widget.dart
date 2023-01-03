import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmptyWidget extends StatelessWidget {
  int dataLenght;
  Widget child;
  EmptyWidget({
    required this.dataLenght,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (dataLenght == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'No Data Found.',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}
