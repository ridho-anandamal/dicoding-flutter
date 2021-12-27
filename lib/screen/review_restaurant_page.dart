import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';

class ReviewRestaurantPage extends StatefulWidget {
  static const String routeName = '/review';
  static const String pageName = 'Review';
  final RestaurantDataDetail restaurant;
  const ReviewRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<ReviewRestaurantPage> createState() => _ReviewRestaurantPageState();
}

class _ReviewRestaurantPageState extends State<ReviewRestaurantPage> {
  String? _nameValue;

  String? _reviewValue;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ReviewRestaurantPage.pageName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Beri Review Restaurant ${widget.restaurant.name}',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Siapa namamu?'),
                      onChanged: (value) {
                        _nameValue = value;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Berikan pendapatmu'),
                      onChanged: (value) {
                        _reviewValue = value;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (_nameValue != null && _reviewValue != null) {
                          try {
                            await ApiRestaurant.postReview(
                                name: _nameValue!,
                                review: _reviewValue!,
                                id: widget.restaurant.id!);
                            SnackBar snackBar = const SnackBar(
                                content: Text('Memberikan review berhasil'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(const Duration(seconds: 2),
                                () => Navigation.back());
                          } catch (error) {
                            SnackBar snackBar = const SnackBar(
                                content: Text('Gagal memberikan review'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          SnackBar snackBar = const SnackBar(
                              content: Text('Formulir masih ada yang kosong'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'Kirim Review',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(20, 60)),
                        backgroundColor: MaterialStateProperty.all(redColor400),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Beri Review Restaurant ${widget.restaurant.name}',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CupertinoTextField(
                      placeholder: 'Siapa namamu?',
                      onChanged: (value) {
                        _nameValue = value;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextField(
                      placeholder: 'Berikan pendapatmu',
                      onChanged: (value) {
                        _reviewValue = value;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton(
                      onPressed: () async {
                        if (_nameValue != null && _reviewValue != null) {
                          try {
                            await ApiRestaurant.postReview(
                                name: _nameValue!,
                                review: _reviewValue!,
                                id: widget.restaurant.id!);
                            SnackBar snackBar = const SnackBar(
                                content: Text('Memberikan review berhasil'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(const Duration(seconds: 2),
                                () => Navigation.back());
                          } catch (error) {
                            SnackBar snackBar = const SnackBar(
                                content: Text('Gagal memberikan review'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          SnackBar snackBar = const SnackBar(
                              content: Text('Formulir masih ada yang kosong'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'Kirim Review',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
