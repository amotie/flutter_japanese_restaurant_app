import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/food/food_bloc.dart';
import '../../data/model/food.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesFoodDetailsAppBar extends StatelessWidget {
  final Food food;
  const ImagesFoodDetailsAppBar({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: MediaQuery.of(context).size.height * .4,
      stretch: true,
      centerTitle: true,
      title: Text(food.name),
      flexibleSpace: FlexibleSpaceBar(
        background: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              CarouselSlider.builder(
                itemCount: state
                    .foodList[state.foodList.getIndex(food)].gallery.length,
                itemBuilder: (context, index, _) {
                  return Image.asset(
                    food.gallery[index],
                    scale: 2,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .8,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context
                        .read<FoodBloc>()
                        .add(ChangeActiveIndexGallery(food, index));
                  },
                ),
              ),
              Positioned(
                bottom: 50,
                right: 30,
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: state.foodList[state.foodList.getIndex(food)]
                        .indexOfActiveGallery,
                    count: state
                        .foodList[state.foodList.getIndex(food)].gallery.length,
                    duration: const Duration(milliseconds: 500),
                    effect: WormEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotWidth: 10.0,
                        dotHeight: 10.0),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
