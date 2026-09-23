import 'package:flutter/material.dart';
import 'package:zara_app/data/models/product_model.dart';

import 'product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;
  final String size;
  final String color;

  CartItem({
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });

  double get totalPrice {
    return product.price * quantity;
  }
}

class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String phoneNumber;
  final String address;

  const UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.phoneNumber,
    required this.address,
  });
}