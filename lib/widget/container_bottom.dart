import 'package:flutter/material.dart';

class ContainerBottom extends StatelessWidget {
  final Widget child;
  const ContainerBottom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: 72,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 5,
              color: Colors.black12,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
