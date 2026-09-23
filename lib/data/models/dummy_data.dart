import 'package:zara_app/data/models/category_model.dart';
import 'package:zara_app/data/models/notifications.dart';
import 'package:zara_app/data/models/order.dart';
import 'package:zara_app/data/models/user_cart_model.dart';

import '../models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "Men's Relaxed Fit Hoodie",
    image: "assets/images/product_1.png",
    price: 40.0,
    category: "Hoodies",
    color: "Green",
    sizes: ["S", "M", "L", "XL"],
    description: "Relaxed fit hoodie with a comfortable everyday design.",
    isNew: true,
  ),

  ProductModel(
    id: 2,
    name: "Men's Oversized Hoodie",
    image: "assets/images/product_2.png",
    price: 45.0,
    category: "Hoodies",
    color: "Black",
    sizes: ["S", "M", "L", "XL"],
    description: "Oversized hoodie with a soft and comfortable feel.",
  ),

  ProductModel(
    id: 3,
    name: "Orange Zip Hoodie",
    image: "assets/images/product_3.png",
    price: 42.0,
    category: "Hoodies",
    color: "Orange",
    sizes: ["S", "M", "L"],
    description: "Casual orange hoodie suitable for everyday outfits.",
    isNew: true,
  ),

  ProductModel(
    id: 4,
    name: "Printed Casual Shirt",
    image: "assets/images/product_4.png",
    price: 35.0,
    category: "Shirts",
    color: "Green",
    sizes: ["S", "M", "L", "XL"],
    description: "Casual printed shirt with a relaxed fit.",
  ),

  ProductModel(
    id: 5,
    name: "Basic Cotton T-Shirt",
    image: "assets/images/product_5.png",
    price: 25.0,
    category: "Shirts",
    color: "White",
    sizes: ["S", "M", "L", "XL"],
    description: "Basic cotton T-shirt for everyday wear.",
  ),

  ProductModel(
    id: 6,
    name: "Wide Leg Jeans",
    image: "assets/images/product_6.png",
    price: 50.0,
    category: "Jeans",
    color: "Blue",
    sizes: ["28", "30", "32", "34"],
    description: "Wide leg jeans with a modern casual fit.",
  ),

  ProductModel(
    id: 7,
    name: "Classic Sneakers",
    image: "assets/images/product_7.png",
    price: 60.0,
    category: "Shoes",
    color: "White",
    sizes: ["40", "41", "42", "43", "44"],
    description: "Classic sneakers designed for everyday comfort.",
  ),

  ProductModel(
    id: 8,
    name: "Casual Shoulder Bag",
    image: "assets/images/product_8.png",
    price: 30.0,
    category: "Bags",
    color: "Brown",
    sizes: [],
    description: "Simple casual shoulder bag.",
  ),
];

final List<Category> categories = [
  Category(
    id: 1,
    name: "Hoodies",
    image: "assets/images/category_hoodies.png",
  ),

  Category(
    id: 2,
    name: "Accessories",
    image: "assets/images/category_accessories.png",
  ),

  Category(
    id: 3,
    name: "Shirts",
    image: "assets/images/category_shirts.png",
  ),

  Category(
    id: 4,
    name: "Shoes",
    image: "assets/images/category_shoes.png",
  ),

  Category(
    id: 5,
    name: "Bags",
    image: "assets/images/category_bags.png",
  ),
];
final List<CartItem> cartItems = [
  CartItem(
    product: products[0],
    quantity: 1,
    size: "M",
    color: "Green",
  ),

  CartItem(
    product: products[5],
    quantity: 2,
    size: "32",
    color: "Blue",
  ),
];
final List<Order> orders = [
  Order(
    id: 1,
    orderNumber: "#456765",
    items: [cartItems[0]],
    total: 40.0,
    status: "Delivered",
    date: "28 May",
    shippingAddress: "21 Main Street, Cairo",
  ),

  Order(
    id: 2,
    orderNumber: "#456489",
    items: [cartItems[1]],
    total: 100.0,
    status: "Shipped",
    date: "26 May",
    shippingAddress: "15 Business Street, Cairo",
  ),

  Order(
    id: 3,
    orderNumber: "#456320",
    items: [cartItems[0], cartItems[1]],
    total: 140.0,
    status: "Order Confirmed",
    date: "24 May",
    shippingAddress: "21 Main Street, Cairo",
  ),
];
final List<NotificationModel> notifications = [
  NotificationModel(
    id: 1,
    title: "Order Shipped",
    message: "Your order #456489 has been shipped.",
    date: "Today",
  ),

  NotificationModel(
    id: 2,
    title: "Special Offer",
    message: "Check out our latest collection.",
    date: "Yesterday",
    isRead: true,
  ),

  NotificationModel(
    id: 3,
    title: "Order Delivered",
    message: "Your order #456765 has been delivered.",
    date: "28 May",
    isRead: true,
  ),
];