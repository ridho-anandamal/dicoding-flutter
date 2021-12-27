import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';

class ContainerReview extends StatelessWidget {
  final List costumerReview;
  final String title;
  const ContainerReview(
      {Key? key, required this.costumerReview, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 12,
          ),
          Consumer<PreferencecsSettingsProvider>(
            builder: (context, preferencesSettings, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: costumerReview.map((review) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            color: preferencesSettings.isDarkTheme ? const Color(0x2FFFFFFF) :const Color(0x2F000000),
                            blurRadius: 1,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.name,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          review.date,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          review.review,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
