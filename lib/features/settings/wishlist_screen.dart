import 'package:flutter/material.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/data/models/product_model.dart';

class WishlistStore {
  static final List<ProductModel> items = [];

  static bool contains(ProductModel product) {
    return items.any((item) => item.id == product.id);
  }

  static void toggle(ProductModel product) {
    if (contains(product)) {
      items.removeWhere((item) => item.id == product.id);
    } else {
      items.add(product);
    }
  }
}

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistItems = WishlistStore.items;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xFFF4F4F4),
                        child: AppBackButton(onTap: () {
                          Navigator.pop(context);
                        }),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Wishlist (${wishlistItems.length})',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: wishlistItems.isEmpty
                        ? const Center(
                            child: Text('No products in wishlist yet.'),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                            ),
                            itemCount: wishlistItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.68,
                            ),
                            itemBuilder: (context, index) {
                              final item = wishlistItems[index];

                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.vertical(
                                            top: Radius.circular(12),
                                          ),
                                          child: Container(
                                            height: 175,
                                            width: double.infinity,
                                            color: const Color(0xFFF4F4F4),
                                            child: item.path.startsWith('http')
                                                ? Image.network(
                                                    item.path,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    item.path,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 12,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '\$${item.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}