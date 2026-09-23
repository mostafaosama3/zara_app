import 'package:zara_app/data/models/user_cart_model.dart';

class Order {
  final int id;
  final String orderNumber;
  final List<CartItem> items;
  final double total;
  final String status;
  final String date;
  final String shippingAddress;

  Order({
    required this.id,
    required this.orderNumber,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
    required this.shippingAddress,
  });
}