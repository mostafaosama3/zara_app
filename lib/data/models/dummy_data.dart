import 'package:zara_app/data/models/category_model.dart';
import 'package:zara_app/data/models/order.dart';
import 'package:zara_app/data/models/user_cart_model.dart';

import '../models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "Men's Relaxed Fit Hoodie",
    image: "https://image.hm.com/assets/hm/28/50/2850d008f620127bb968cb432a5f0914022d7f6d.jpg?imwidth=2160",
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
    image: "https://image.hm.com/assets/hm/87/d2/87d2343b95dc263aea489f1e0ebe0fc64566181a.jpg?imwidth=2160",
    price: 45.0,
    category: "Hoodies",
    color: "Black",
    sizes: ["S", "M", "L", "XL"],
    description: "Oversized hoodie with a soft and comfortable feel.",
  ),

  ProductModel(
    id: 3,
    name: "Orange Zip Hoodie",
    image: "https://images.napali.app/global/dcshoes-products/all/default/hi-res/edysf03275_dcshoes,w_nls0_frt1.jpg",
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
    image: "https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/466c2c5e3b3dcc58c828b2fe74d32c0e.webp",
    price: 35.0,
    category: "Shirts",
    color: "Green",
    sizes: ["S", "M", "L", "XL"],
    description: "Casual printed shirt with a relaxed fit.",
  ),

  ProductModel(
    id: 5,
    name: "Basic Cotton T-Shirt",
    image: "https://m.media-amazon.com/images/I/51aokCATY3L._AC_SY741_.jpg",
    price: 25.0,
    category: "Shirts",
    color: "White",
    sizes: ["S", "M", "L", "XL"],
    description: "Basic cotton T-shirt for everyday wear.",
  ),

  ProductModel(
    id: 6,
    name: "Wide Leg Jeans",
    image: "https://m.media-amazon.com/images/I/61keDFOy+BL._AC_SY879_.jpg",
    price: 50.0,
    category: "Jeans",
    color: "Blue",
    sizes: ["28", "30", "32", "34"],
    description: "Wide leg jeans with a modern casual fit.",
  ),

  ProductModel(
    id: 7,
    name: "Classic Sneakers",
    image: "https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/f12e86c4d23bc706499d084d9128de0f.webp",
    price: 60.0,
    category: "Shoes",
    color: "White",
    sizes: ["40", "41", "42", "43", "44"],
    description: "Classic sneakers designed for everyday comfort.",
  ),

  ProductModel(
    id: 8,
    name: "Casual Shoulder Bag",
    image: "https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/2f7c19eb61a2a61a6fb3a741ad92540a.webp",
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
    image: "https://static.ftshp.digital/img/p/1/6/7/5/6/5/4/1675654-thickbox.jpg",
  ),

  Category(
    id: 2,
    name: "Accessories",
    image: "https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/a49054d3187da6656dceba22aac87eac.webp",
  ),

  Category(
    id: 3,
    name: "Shorts",
    image: "https://d3vfig6e0r0snz.cloudfront.net/rcYjnYuenaTH5vyDF/images/products/57a3b084dbafe7433b8f95133c6596dd.webp",
  ),

  Category(
    id: 4,
    name: "Shoes",
    image: "https://cdn.dam.salomon.com/15ed8735-6ea9-4570-b0fb-b36d00a8c7bd/L49202000/PNG-2000px-max-72dpi.png?width=640&fit=cover&optimize=medium&bg-color=f5f5f5&format=pjpg&auto=avif&canvas=116p%2C144p",
  ),

  Category(
    id: 5,
    name: "Bags",
    image: "https://i.ebayimg.com/thumbs/images/g/2TIAAeSw-Edpu9Bq/s-l500.jpg",
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
final List orders = [
  OrderModel(
      orderId: '456765',
      itemsCount: 4,
      status: 'Processing',
      shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
      phoneNumber: '121-224-7890',
      trackingSteps: [
        OrderStatusStep(title: 'Delivered', date: '28 May', isCompleted: false),
        OrderStatusStep(title: 'Shipped', date: '28 May', isCompleted: true),
        OrderStatusStep(title: 'Order Confirmed', date: '28 May', isCompleted: true),
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

