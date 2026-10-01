import 'package:zara_app/data/models/order.dart';
import 'package:zara_app/data/models/product_model.dart';
import 'package:zara_app/data/models/user_cart_model.dart';

class ShopCategory {
  const ShopCategory({required this.name, required this.imageAsset});

  final String name;
  final String imageAsset;
}

const List<ShopCategory> shopCategories = [
  ShopCategory(name: 'Hoodies', imageAsset: 'Assets/images/hoodies.png'),
  ShopCategory(name: 'Shorts', imageAsset: 'Assets/images/shorts.png'),
  ShopCategory(name: 'Shoes', imageAsset: 'Assets/images/shoes.png'),
  ShopCategory(name: 'Bags', imageAsset: 'Assets/images/bag.png'),
  ShopCategory(
    name: 'Accessories',
    imageAsset: 'Assets/images/accessories.png',
  ),
];

/// The single source of truth for products used across the app.
final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "Men's Relaxed Fit Hoodie",
    path: 'https://image.hm.com/assets/hm/28/50/2850d008f620127bb968cb432a5f0914022d7f6d.jpg?imwidth=2160',
    price: 40,
    category: 'Hoodies',
    color: 'Green',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Relaxed fit hoodie with a comfortable everyday design.',
    isNew: true,
  ),
  ProductModel(
    id: 2,
    name: "Men's Oversized Hoodie",
    path: 'https://image.hm.com/assets/hm/87/d2/87d2343b95dc263aea489f1e0ebe0fc64566181a.jpg?imwidth=2160',
    price: 45,
    category: 'Hoodies',
    color: 'Black',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Oversized hoodie with a soft and comfortable feel.',
  ),
  ProductModel(
    id: 3,
    name: 'Orange Zip Hoodie',
    path: 'https://images.napali.app/global/dcshoes-products/all/default/hi-res/edysf03275_dcshoes,w_nls0_frt1.jpg',
    price: 42,
    category: 'Hoodies',
    color: 'Orange',
    sizes: ['S', 'M', 'L'],
    description: 'Casual orange hoodie suitable for everyday outfits.',
    isNew: true,
  ),
  ProductModel(
    id: 4,
    name: 'Printed Casual Shirt',
    path: 'https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/466c2c5e3b3dcc58c828b2fe74d32c0e.webp',
    price: 35,
    category: 'Shirts',
    color: 'Green',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Casual printed shirt with a relaxed fit.',
  ),
  ProductModel(
    id: 5,
    name: 'Basic Cotton T-Shirt',
    path: 'https://m.media-amazon.com/images/I/51aokCATY3L._AC_SY741_.jpg',
    price: 25,
    category: 'Shirts',
    color: 'White',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Basic cotton T-shirt for everyday wear.',
  ),
  ProductModel(
    id: 6,
    name: 'Wide Leg Jeans',
    path: 'https://m.media-amazon.com/images/I/61keDFOy+BL._AC_SY879_.jpg',
    price: 50,
    category: 'Jeans',
    color: 'Blue',
    sizes: ['28', '30', '32', '34'],
    description: 'Wide leg jeans with a modern casual fit.',
  ),
  ProductModel(
    id: 7,
    name: 'Classic Sneakers',
    path: 'https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/f12e86c4d23bc706499d084d9128de0f.webp',
    price: 60,
    category: 'Shoes',
    color: 'White',
    sizes: ['40', '41', '42', '43', '44'],
    description: 'Classic sneakers designed for everyday comfort.',
  ),
  ProductModel(
    id: 8,
    name: 'Casual Shoulder Bag',
    path: 'https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/2f7c19eb61a2a61a6fb3a741ad92540a.webp',
    price: 30,
    category: 'Bags',
    color: 'Brown',
    sizes: [],
    description: 'Simple casual shoulder bag.',
  ),
  ProductModel(
    id: 9,
    name: "Men's Fleece Pullover Hoodie",
    path: 'Assets/images/pullover.png',
    price: 100,
    category: 'Hoodies',
    color: 'Green',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'A soft fleece pullover hoodie for everyday comfort.',
  ),
  ProductModel(
    id: 10,
    name: 'Fleece Pullover Skate Hoodie',
    path: 'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/84/1858331/1.jpg?8459',
    price: 150.97,
    category: 'Hoodies',
    color: 'Black',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'A warm fleece skate hoodie with a relaxed fit.',
  ),
  ProductModel(
    id: 11,
    name: 'Fleece Skate Hoodie',
    path: 'https://media.sivasdescalzo.com/media/catalog/product/D/H/DH4683-010_sivasdescalzo-Nike_SB-M_NK_SB_PREMIUM_GFX_FLEECE-1636018873-1.jpg?width=768&quality=72&optimize=high&format=auto',
    price: 110,
    category: 'Hoodies',
    color: 'Black',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'A bold fleece skate hoodie designed for everyday wear.',
  ),
  ProductModel(
    id: 12,
    name: "Men's Ice-Dye Pullover Hoodie",
    path: 'Assets/images/hoodies.png',
    price: 128.97,
    category: 'Hoodies',
    color: 'Purple',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'A comfortable pullover hoodie with a colorful ice-dye look.',
  ),
  ProductModel(
    id: 13,
    name: 'Classic Training Shorts',
    path: 'Assets/images/shorts.png',
    price: 38,
    category: 'Shorts',
    color: 'Green',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Lightweight shorts designed for comfort and movement.',
  ),
  ProductModel(
    id: 14,
    name: 'Relaxed Fit Utility Shorts',
    path: 'https://capouk.com/cdn/shop/files/DSC08568.jpg?v=1745841954&width=1000',
    price: 45,
    category: 'Shorts',
    color: 'Olive',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Relaxed fit shorts with a versatile everyday style.',
  ),
  ProductModel(
    id: 15,
    name: 'Everyday Cotton Shorts',
    path: 'https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/739e1c1a223997a15e653c88cecd31ec.webp',
    price: 32,
    category: 'Shorts',
    color: 'Black',
    sizes: ['S', 'M', 'L'],
    description: 'Easy-to-wear cotton shorts for casual outfits.',
  ),
  ProductModel(
    id: 116,
    name: 'Max Cirro Slide Sandals',
    path: 'Assets/images/slides.png',
    price: 55,
    oldPrice: 100.97,
    category: 'Shoes',
    color: 'Black',
    sizes: ['40', '41', '42', '43'],
    description: 'Comfortable slides with a lightweight, cushioned sole.',
  ),
  ProductModel(
    id: 17,
    name: 'Everyday Running Shoes',
    path: 'Assets/images/shoes.png',
    price: 72,
    category: 'Shoes',
    color: 'Blue',
    sizes: ['40', '41', '42', '43', '44'],
    description: 'Versatile shoes made for everyday comfort.',
  ),
  ProductModel(
    id: 18,
    name: 'Everyday Crossbody Bag',
    path: 'Assets/images/bag.png',
    price: 48,
    category: 'Bags',
    color: 'Blue',
    sizes: [],
    description: 'A practical crossbody bag for your daily essentials.',
  ),
  ProductModel(
    id: 19,
    name: 'Compact Travel Bag',
    path: 'https://seabags.com/cdn/shop/files/V007033-173.jpg?v=1788266589&width=1100',
    price: 64,
    category: 'Bags',
    color: 'Orange',
    sizes: [],
    description: 'A compact bag with room for all the essentials.',
  ),
  ProductModel(
    id: 20,
    name: 'Everyday Sunglasses',
    path: 'https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/dac2d625a62cc56e39be7ad8c9031d89.webp',
    price: 29,
    category: 'Accessories',
    color: 'Black',
    sizes: [],
    description: 'A clean, easy-to-style accessory for sunny days.',
  ),
  ProductModel(
    id: 21,
    name: 'Sport Cap',
    path: 'https://jlood.com/cdn/shop/files/nike-dri-fit-legacy91-training-hat-blk-accessories-jlood-464.webp?v=1778957650&width=1100',
    price: 25,
    category: 'Accessories',
    color: 'Black',
    sizes: [],
    description: 'A comfortable cap with a classic everyday shape.',
  ),
  ProductModel(
    id: 22,
    name: 'Nike Recharge',
    path: 'https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto,u_9ddf04c7-2a9a-4d76-add1-d15af8f0263d,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/e9898daf-758f-4a85-8668-1f86e5b3e192/NK+SS+RECHARGE+STRAW+BOTTLE+24.png',
    price: 10,
    category: 'Accessories',
    color: 'Black',
    sizes: [],
    description: 'Simple accessories to complete your everyday look.',
  ),
  ProductModel(
    id: 23,
    name: "Men's Harrington Jacket",
    path: 'Assets/images/jacket.png',
    price: 148,
    category: 'Jackets',
    color: 'Olive',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'A timeless Harrington jacket with a relaxed, versatile fit.',
  ),
];

final List<ProductModel> featuredProducts = [
  products.firstWhere((product) => product.id == 23),
  products.firstWhere((product) => product.id == 116),
  products.firstWhere((product) => product.id == 9),
];

final List<ProductModel> newProducts = [
  ...products.where((product) => product.isNew),
  ...products.where((product) => product.category == 'Hoodies').take(2),
];

ShopCategory? categoryForName(String name) {
  final normalizedName = name.toLowerCase() == 'bag'
      ? 'bags'
      : name.toLowerCase();
  for (final category in shopCategories) {
    if (category.name.toLowerCase() == normalizedName) return category;
  }
  return null;
}

final List<CartItem> cartItems = [
  CartItem(
    product: products.firstWhere((product) => product.id == 1),
    quantity: 1,
    size: 'M',
    color: 'Green',
  ),
  CartItem(
    product: products.firstWhere((product) => product.id == 6),
    quantity: 2,
    size: '32',
    color: 'Blue',
  ),
];

final List<OrderModel> orders = [
  OrderModel(
    orderId: '456765',
    itemsCount: 4,
    status: 'Processing',
    shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    phoneNumber: '121-224-7890',
    trackingSteps: [
      OrderStatusStep(title: 'Delivered', date: '28 May', isCompleted: false),
      OrderStatusStep(title: 'Shipped', date: '28 May', isCompleted: true),
      OrderStatusStep(
        title: 'Order Confirmed',
        date: '28 May',
        isCompleted: true,
      ),
      OrderStatusStep(title: 'Order Placed', date: '28 May', isCompleted: true),
    ],
  ),
  OrderModel(
    orderId: '454569',
    itemsCount: 2,
    status: 'Processing',
    shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    phoneNumber: '121-224-7890',
    trackingSteps: [],
  ),
  OrderModel(
    orderId: '454809',
    itemsCount: 1,
    status: 'Processing',
    shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    phoneNumber: '121-224-7890',
    trackingSteps: [],
  ),
];
