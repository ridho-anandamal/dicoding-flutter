import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';

class ContainerTags extends StatelessWidget {
  final List restaurantList;
  final String title;
  const ContainerTags(
      {required this.title, required this.restaurantList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          const SizedBox(
            height: 12.0,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: restaurantList.map((item) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: redColor50,
                ),
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: redColor700,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
