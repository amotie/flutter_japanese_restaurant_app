import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/core/app_localizations.dart';
import 'package:flutter_japanese_restaurant_app/main.dart';
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
                  "assets/images/OishiiSushi-Logo-dark1.png",
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('WELCOME_LABEL'),
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 50,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    AutoSizeText(
                      AppLocalizations.of(context)!
                          .translate('WELCOME_DSCRIPTION'),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 25,
                            height: 1.2,
                          ),
                      maxLines: 10,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
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
                        fixedSize:
                            MaterialStateProperty.all(const Size(400, 80)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: AutoSizeText(
                          'Lets Start',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // MyApp.setLocal(context, const Locale('ar'));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        fixedSize:
                            MaterialStateProperty.all(const Size(400, 80)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: AutoSizeText(
                          AppLocalizations.of(context)!
                              .translate('LANGUAGE_LABEL'),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
