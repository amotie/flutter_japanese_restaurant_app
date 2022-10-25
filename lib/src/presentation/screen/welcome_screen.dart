import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/screen/home_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/custom_page_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  AppAsset.sushi1,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 50,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 25,
                            height: 1.2,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: HomeScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(const Size(400, 80)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Lets Start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
