import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';

import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';

import '../../../core/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/food/food_bloc.dart';
import '../../business_logic/blocs/theme/theme_bloc.dart';
import '../widget/counter_button.dart';
import '../animation/scale_animation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  final Food food;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        food.name,
        style: TextStyle(
            color: context.read<ThemeBloc>().isLightTheme
                ? Colors.black
                : Colors.white),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.more_vert),
      //   )
      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // final List<Food> foodList = context.watch<FoodBloc>().state.foodList;

    // Widget fab(VoidCallback onPressed) {
    //   return FloatingActionButton(
    //     elevation: 0.0,
    //     backgroundColor: LightThemeColor.accent,
    //     child: foodList[foodList.getIndex(food)].isFavorite
    //         ? const Icon(AppIcon.heart)
    //         : const Icon(AppIcon.outlinedHeart),
    //     onPressed: onPressed,
    //   );
    // }

    return Scaffold(
      appBar: _appBar(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: fab(() => context.read<FoodBloc>().add(
      //       FavoriteItemEvent(
      //         foodList[foodList.getIndex(
      //           food,
      //         )],
      //       ),
      //     )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: height * 0.5,
          child: Container(
            decoration: BoxDecoration(
              color: context.read<ThemeBloc>().isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     RatingBar.builder(
                    //       itemPadding: EdgeInsets.zero,
                    //       itemSize: 20,
                    //       initialRating: food.score,
                    //       minRating: 1,
                    //       direction: Axis.horizontal,
                    //       allowHalfRating: true,
                    //       itemCount: 5,
                    //       glow: false,
                    //       ignoreGestures: true,
                    //       itemBuilder: (context, _) => const FaIcon(
                    //         FontAwesomeIcons.solidStar,
                    //         color: LightThemeColor.yellow,
                    //       ),
                    //       onRatingUpdate: (rating) {},
                    //     ),
                    //     const SizedBox(width: 15),
                    //     Text(food.score.toString(),
                    //         style: Theme.of(context).textTheme.subtitle1),
                    //     const SizedBox(width: 5),
                    //     Text("(${food.voter})",
                    //         style: Theme.of(context).textTheme.subtitle1)
                    //   ],
                    // ).fadeAnimation(0.4),
                    // const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${food.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(color: LightThemeColor.accent),
                        ),
                        BlocBuilder<FoodBloc, FoodState>(
                          builder: (context, state) {
                            return CounterButton(
                              onIncrementSelected: () => context
                                  .read<FoodBloc>()
                                  .add(IncreaseQuantityEvent(food)),
                              onDecrementSelected: () => context
                                  .read<FoodBloc>()
                                  .add(DecreaseQuantityEvent(food)),
                              label: Text(
                                state.foodList[state.foodList.getIndex(food)]
                                    .quantity
                                    .toString(),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            );
                          },
                        )
                      ],
                    ).fadeAnimation(0.6),
                    const SizedBox(height: 15),
                    Text("Description",
                            style: Theme.of(context).textTheme.headline2)
                        .fadeAnimation(0.8),
                    const SizedBox(height: 15),
                    Text(
                      food.description,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 20,
                          ),
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 120),
                    Center(
                      // width: double.infinity,
                      // height: 45,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<FoodBloc>()
                              .add(AddToCartEvent(food)),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(Size(400, 60)),
                          ),
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ScaleAnimation(
        child: Center(
          child: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
            return Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: state
                      .foodList[state.foodList.getIndex(food)].gallery.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Image.asset(
                    food.gallery[itemIndex],
                    scale: 2,
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      print(index);
                      context
                          .read<FoodBloc>()
                          .add(ChangeActiveIndexGallery(food, index));
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: state
                            .foodList[state.foodList.getIndex(food)]
                            .indexOfActiveGallery,
                        count: state.foodList[state.foodList.getIndex(food)]
                            .gallery.length,
                        duration: const Duration(milliseconds: 500),
                        effect: WormEffect(
                            activeDotColor: Theme.of(context).primaryColor,
                            dotWidth: 10.0,
                            dotHeight: 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
