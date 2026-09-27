import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara_app/core/constants/app_fonts.dart';
import 'package:zara_app/core/constants/appimages.dart';
import 'package:zara_app/core/styles/appcolor.dart';
import 'package:zara_app/core/styles/text_styles.dart';
import 'package:zara_app/core/widgets/app_back_button.dart';
import 'package:zara_app/core/widgets/custom_svg_image.dart';
import 'package:zara_app/data/models/order.dart';

class TrackOrderScreen extends StatelessWidget {
  final OrderModel order;

  const TrackOrderScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
            AppBackButton(
              onTap: (){
                Navigator.pop(context);
              },
            ),
 
        ),
        title: Text(
          'Order #${order.orderId}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.trackingSteps.length,
                itemBuilder: (context, index) {
                  final step = order.trackingSteps[index];
                  final isLast = index == order.trackingSteps.length - 1;
                  return IntrinsicHeight(
                    
                    child: Row(
                      
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Column for Dot Indicator and Line
                        Column(
                          
                          children: [
                            // Dot Container
                            
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: step.isCompleted
                                      ? AppColors.primaryColor
                                      : AppColors.accentColor,
                                ),
                                child: step.isCompleted
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: AppColors.whiteColor,
                                      )
                                    : null,
                              ),
                            ),
                            
                          ],
                        ),
                      
                        // Step Title and Date
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: step.isCompleted
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: step.isCompleted
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              
                                Text(
                                  step.date,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          
              const SizedBox(height: 20),
          
              // 2. Order Items
               Text(
                'Order Items',
                style: TextStyles.body.copyWith(
                  fontWeight: .bold,
                  fontFamily: AppFonts.gabarito,
                ),
              ),
              Gap(15),
              Container(
                width: 380,
                height: 72,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                   CustomSvgImage(path: AppImages.receiptSvg,color: AppColors.blackColor,height: 30,width: 40,),
                    const SizedBox(width: 12),
                    Text(
                      '${order.itemsCount} items',
                      style:TextStyles.body
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              Gap(30),
          
              // 3. Shipping Details
              Text(
                'Shipping details',
                style: TextStyles.body.copyWith(fontWeight: .bold),
              ),
              const Gap(15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.shippingAddress,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const Gap(7),
                    Text(
                      order.phoneNumber,
                      style: const TextStyle(fontSize: 13, color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
