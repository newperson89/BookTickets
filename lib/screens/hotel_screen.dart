import 'package:delivery/utils/app_layout.dart';
import 'package:delivery/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic>hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15), vertical: AppLayout.getHeight(17)),
      margin:  EdgeInsets.only(right: 17, top: AppLayout.getHeight(5)),
      width: size.width*0.6,
      height: AppLayout.getHeight(350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(24)),
        color: Styles.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ]
      ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppLayout.getHeight(180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
            color: Styles.primaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
                image: AssetImage("assets/${hotel['image']}")
            ),
          ),
        ),
        const Gap(15),
        Text(hotel['place'],
        style: Styles.headlineStyle2.copyWith(color: Styles.kakiColor),
        ),
        const Gap(5),
        Text(hotel['destination'],
          style: Styles.headlineStyle3.copyWith(color: Colors.white),
        ),
        Text('\$${hotel['price']}/night',
          style: Styles.headlineStyle1.copyWith(color: Styles.kakiColor),
        ),
      ],
    ),
    );
  }
}
