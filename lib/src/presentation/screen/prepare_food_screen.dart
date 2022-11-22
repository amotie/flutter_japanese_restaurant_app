import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:lottie/lottie.dart';

class PrepareFoodScreen extends StatefulWidget {
  const PrepareFoodScreen({Key? key}) : super(key: key);

  @override
  State<PrepareFoodScreen> createState() => _PrepareFoodScreenState();
}

class _PrepareFoodScreenState extends State<PrepareFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Lottie.asset(
                    "assets/images/sushi-belt.json",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Yayy!\nyour Food is Prepared\n🥳',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
