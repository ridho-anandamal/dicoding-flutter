import 'package:flutter/material.dart';

class ComponentTagText extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const ComponentTagText(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: textColor,
            ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}

class ComponentTagWidget extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color textColor;
  const ComponentTagWidget(
      {Key? key,
      required this.child,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
