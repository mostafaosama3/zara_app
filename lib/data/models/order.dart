import 'package:zara_app/data/models/user_cart_model.dart';

class OrderStatusStep {
  final String title;
  final String date;
  final bool isCompleted;

  OrderStatusStep({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

class OrderModel {
  final String orderId;
  final int itemsCount;
  final String status; // Processing, Shipped, Delivered, etc.
  final List trackingSteps;
  final String shippingAddress;
  final String phoneNumber;

  OrderModel({
    required this.orderId,
    required this.itemsCount,
    required this.status,
    required this.trackingSteps,
    required this.shippingAddress,
    required this.phoneNumber,
  });
}