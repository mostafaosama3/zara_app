import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_icons.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/functions/navigations.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/dummy_data.dart';
import 'package:zara_app/features/shop/page/track_order_screen.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Canceled',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
          'Orders',
          style: TextStyles.subtitle.copyWith(fontWeight: .bold)
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Horizontal Categories Filter
          SizedBox(
            height: 32,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = selectedCategoryIndex == index;
                return ChoiceChip(
                  label: Text(categories[index]),
                  selected: isSelected,
                  onSelected: (val) =>
                      setState(() => selectedCategoryIndex = index),
                  selectedColor: AppColors.primaryColor,
                  backgroundColor: AppColors.accentColor,
                  labelStyle: TextStyle(
                    color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide.none,
                  showCheckmark: false,
                );
              },
            ),
          ),

          const Gap(20),

          //  Orders List from dummy_data
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];

                return Container(
  margin: const EdgeInsets.only(bottom: 12),
  child: ListTile(
    tileColor: AppColors.accentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), 
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 4,
    ),
    leading: CustomSvgImage(path: AppImages.receiptSvg,color: AppColors.blackColor,height: 30,width: 40,),
    title: Text(
      'Order #${order.orderId}',
      style: TextStyles.caption1.copyWith(fontWeight: .bold)
    ),
    subtitle: Text(
      '${order.itemsCount} items',
      style: TextStyles.caption2.copyWith(
      
        color: AppColors.greyColor
      )
    ),
    trailing: CustomSvgImage(path: AppIcons.arrowrightSvg,color: AppColors.blackColor,height:25,width:25),
    onTap: () {
      pushTo(context, TrackOrderScreen(order: order));
    },
  ),
);
              },
            ),
          ),
        ],
      ),
    
    );
  }
  List<dynamic> get filteredOrders => orders
      .where((order) => order.status == categories[selectedCategoryIndex])
      .toList();
}

