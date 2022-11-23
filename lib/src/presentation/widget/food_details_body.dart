import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/food/food_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/counter_button.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/special_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash/flash.dart';

class FoodDetalesBody extends StatelessWidget {
  final Food food;
  const FoodDetalesBody({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.message_rounded,
                      ),
                      Text("Any Special Request?",
                              style: Theme.of(context).textTheme.headline2)
                          .fadeAnimation(0.8),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const SpecialRequest(),
                          );
                        },
                        child: Text(
                          "Add Note",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: LightThemeColor.accent),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  // width: double.infinity,
                  // height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<FoodBloc>().add(AddToCartEvent(food));
                      showFlash(
                        context: context,
                        duration: const Duration(seconds: 3),
                        builder: (context, controller) {
                          return Flash(
                            alignment: Alignment.bottomLeft,
                            controller: controller,
                            backgroundColor: const Color(0xFF03CEA4),
                            boxShadows: kElevationToShadow[4],
                            horizontalDismissDirection:
                                HorizontalDismissDirection.horizontal,
                            child: FlashBar(
                              content: Text(
                                "Item Added To The Cart",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(400, 60)),
                    ),
                    child: const Text(
                      "Add to cart",
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
      ]),
    );
  }
}
