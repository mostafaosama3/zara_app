import 'package:flutter/material.dart';
import 'package:zara_app/data/models/product_model.dart';

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

class CartStore {
  static final List<CartItem> items = [];

  static double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  static double get shippingCost => items.isEmpty ? 0.0 : 8.0;

  static double get tax => 0.0;

  static double get total => subtotal + shippingCost + tax;

  static void addOrUpdate(
    ProductModel product, {
    required String size,
    required String color,
  }) {
    final index = items.indexWhere(
      (item) => item.product.id == product.id && item.size == size && item.color == color,
    );

    if (index >= 0) {
      final existing = items[index];
      items[index] = CartItem(
        product: existing.product,
        quantity: existing.quantity + 1,
        size: existing.size,
        color: existing.color,
      );
      return;
    }

    items.add(
      CartItem(
        product: product,
        quantity: 1,
        size: size,
        color: color,
      ),
    );
  }

  static void increaseAt(int index) {
    if (index < 0 || index >= items.length) return;
    final current = items[index];
    items[index] = CartItem(
      product: current.product,
      quantity: current.quantity + 1,
      size: current.size,
      color: current.color,
    );
  }

  static void decreaseAt(int index) {
    if (index < 0 || index >= items.length) return;
    final current = items[index];
    if (current.quantity > 1) {
      items[index] = CartItem(
        product: current.product,
        quantity: current.quantity - 1,
        size: current.size,
        color: current.color,
      );
      return;
    }
    items.removeAt(index);
  }

  static void removeAll() {
    items.clear();
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