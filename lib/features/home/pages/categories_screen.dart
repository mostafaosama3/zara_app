import 'package:flutter/material.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/features/home/pages/category_products_screen.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/features/home/pages/home_screen.dart';
import 'package:zara_app/features/home/widgets/category_tile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(onTap: () => pushTo(context, HomeScreen())),
              const SizedBox(height: 14),
              const Text(
                'Shop by Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: shopCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final category = shopCategories[index];
                    return CategoryTile(
                      category: category,
                      onTap: () {
                     pushReplacement(context, CategoryProductsScreen(categoryName: category.name));  
                            
                        
                      } 
                       
                      
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
