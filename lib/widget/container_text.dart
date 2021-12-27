import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final String restaurantString;
  final String title;
  const ContainerText(
      {required this.title, required this.restaurantString, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            restaurantString,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}
