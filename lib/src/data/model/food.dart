import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

enum FoodType {
  all,
  sashimi,
  soup,
  appetizers,
  dessert,
  hosomaki,
  nigiri,
  noodles,
  uramaki,
  salad,
}

@immutable
class Food extends Equatable {
  final int id;
  final String image;
  final String name;
  final double price;
  final int quantity;
  final bool isFavorite;
  final String description;
  final double score;
  final FoodType type;
  final int voter;
  final bool cart;
  final List<String> gallery;
  final int indexOfActiveGallery;

  const Food(
      {this.cart = false,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      this.quantity = 1,
      this.isFavorite = false,
      required this.description,
      required this.score,
      required this.type,
      required this.voter,
      required this.gallery,
      this.indexOfActiveGallery = 0});

  @override
  String toString() {
    return '\nFood{id: $id, name: $name, quantity: $quantity, isFavorite: $isFavorite, cart: $cart}';
  }

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        price,
        quantity,
        isFavorite,
        description,
        score,
        type,
        voter,
        cart,
        indexOfActiveGallery,
      ];

  Food copyWith(
      {int? id,
      String? image,
      String? name,
      double? price,
      int? quantity,
      bool? isFavorite,
      String? description,
      double? score,
      FoodType? type,
      int? voter,
      bool? cart,
      List<String>? gallery,
      int? indexOfActiveGallery}) {
    return Food(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      score: score ?? this.score,
      type: type ?? this.type,
      voter: voter ?? this.voter,
      cart: cart ?? this.cart,
      gallery: gallery ?? this.gallery,
      indexOfActiveGallery: indexOfActiveGallery ?? this.indexOfActiveGallery,
    );
  }
}
