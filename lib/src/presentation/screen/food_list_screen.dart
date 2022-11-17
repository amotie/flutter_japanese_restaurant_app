import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/category/category_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food_category.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/bottom_sheet_custom.dart';
import '../../business_logic/blocs/food/food_bloc.dart';
import '../../business_logic/blocs/theme/theme_bloc.dart';
import '../widget/food_list_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return IconButton(
            icon: FaIcon(
                !state.isLightTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<ThemeBloc>().add(const ThemeEvent()));
      }),
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Icon(Icons.location_on_outlined, color: LightThemeColor.accent),
      //     Text("Location", style: Theme.of(context).textTheme.bodyText1)
      //   ],
      // ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Badge(
      //       badgeColor: LightThemeColor.accent,
      //       badgeContent:
      //           const Text("2", style: TextStyle(color: Colors.white)),
      //       position: BadgePosition.topStart(start: -3),
      //       child: const Icon(Icons.notifications_none, size: 30),
      //     ),
      //   )
      // ],
    );
  }

  Widget _searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search food',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Food> foodList = context.watch<FoodBloc>().state.foodList;

    final List<FoodCategory> categories =
        context.watch<CategoryBloc>().state.foodCategories;

    final List<Food> filteredFood =
        context.watch<CategoryBloc>().state.foodList;

    return Scaffold(
      appBar: _appBar(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(500)),
            // ),
            elevation: 5.0,
            isScrollControlled: true,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (context) => BottomSheetCustom(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .6,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        AppAsset.profileImage,
                        height: 200,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              fontSize: 25,
                              height: 1.2,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     ElevatedButton(
                      //       onPressed: () {},
                      //       style: ButtonStyle(
                      //         shape: MaterialStateProperty.all(
                      //           RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(40),
                      //           ),
                      //         ),
                      //         fixedSize: MaterialStateProperty.all(
                      //             const Size(400, 80)),
                      //       ),
                      //       child: const Padding(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text(
                      //           'Need Help',
                      //           style: TextStyle(
                      //             fontSize: 30,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //         showModalBottomSheet(
                      //             context: context,
                      //             // shape: RoundedRectangleBorder(
                      //             //   borderRadius: BorderRadius.all(Radius.circular(500)),
                      //             // ),
                      //             elevation: 5.0,
                      //             isScrollControlled: true,
                      //             isDismissible: true,
                      //             backgroundColor: Colors.transparent,
                      //             builder: (context) => BottomSheetCustom(
                      //                   child: SizedBox(
                      //                     height: 200,
                      //                     child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.spaceAround,
                      //                         children: [
                      //                           ElevatedButton(
                      //                             onPressed: () {},
                      //                             style: ButtonStyle(
                      //                               shape: MaterialStateProperty
                      //                                   .all(
                      //                                 RoundedRectangleBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(40),
                      //                                 ),
                      //                               ),
                      //                               fixedSize:
                      //                                   MaterialStateProperty
                      //                                       .all(const Size(
                      //                                           400, 80)),
                      //                             ),
                      //                             child: const Padding(
                      //                               padding: EdgeInsets.all(20),
                      //                               child: Text(
                      //                                 'Pay Cash',
                      //                                 style: TextStyle(
                      //                                   fontSize: 30,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           ElevatedButton(
                      //                             onPressed: () {},
                      //                             style: ButtonStyle(
                      //                               shape: MaterialStateProperty
                      //                                   .all(
                      //                                 RoundedRectangleBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(40),
                      //                                 ),
                      //                               ),
                      //                               fixedSize:
                      //                                   MaterialStateProperty
                      //                                       .all(const Size(
                      //                                           400, 80)),
                      //                             ),
                      //                             child: const Padding(
                      //                               padding: EdgeInsets.all(20),
                      //                               child: Text(
                      //                                 'Credit Card',
                      //                                 style: TextStyle(
                      //                                   fontSize: 30,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ]),
                      //                   ),
                      //                 ));
                      //       },
                      //       style: ButtonStyle(
                      //         shape: MaterialStateProperty.all(
                      //           RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(40),
                      //           ),
                      //         ),
                      //         fixedSize: MaterialStateProperty.all(
                      //             const Size(400, 80)),
                      //       ),
                      //       child: const Padding(
                      //         padding: EdgeInsets.all(20),
                      //         child: Text(
                      //           'Payment',
                      //           style: TextStyle(
                      //             fontSize: 30,
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        label: const Text('Call Staff'),
        icon: const Icon(FontAwesomeIcons.userTie),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Morning, David",
              //         style: Theme.of(context).textTheme.headline5)
              //     .fadeAnimation(0.2),
              Text("What do you want to eat \ntoday",
                      style: Theme.of(context).textTheme.headline1)
                  .fadeAnimation(0.4),
              _searchBar(context),
              Text("Available for you",
                  style: Theme.of(context).textTheme.headline3),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (_, index) {
                      FoodCategory category = categories[index];
                      return GestureDetector(
                        onTap: () => context
                            .read<CategoryBloc>()
                            .add(CategoryEvent(category: category)),
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: category.isSelected
                                ? LightThemeColor.accent
                                : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            category.type.name.toCapital,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      color: category.isSelected
                                          ? Colors.white
                                          : Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.color,
                                    ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(padding: EdgeInsets.only(right: 15));
                    },
                  ),
                ),
              ),
              FoodListView(foods: filteredFood),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Best food of the week",
                        style: Theme.of(context).textTheme.headline3),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: Text("See all",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline4
                    //           ?.copyWith(color: LightThemeColor.accent)),
                    // ),
                  ],
                ),
              ),
              FoodListView(foods: foodList, isReversedList: true),
            ],
          ),
        ),
      ),
    );
  }
}
