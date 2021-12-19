import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';

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
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: blackColor),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            restaurantString,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: blackColor,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}
