import 'package:delivery/screens/hotel_screen.dart';
import 'package:delivery/screens/ticket_view.dart';
import 'package:delivery/utils/app_info_list.dart';
import 'package:delivery/utils/app_layout.dart';
import 'package:delivery/utils/app_styles.dart';
import 'package:delivery/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                children: [
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Good Morning", style: Styles.headlineStyle3,
                          ),
                          const Gap(5),
                          Text(
                            "Book tickets", style: Styles.headlineStyle1,
                          ),
                        ],
                      ),
                      Container(
                        height: AppLayout.getHeight(50),
                        width: AppLayout.getWidth(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/img_1.png"))
                        ),
                      ),
                    ],
                  ),
                  const Gap(25),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                      color: const Color(0xFFF4F6FD)
                    ),
                    padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12), vertical: AppLayout.getHeight(12)),
                    child: Row(
                      children: [
                        const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205),),
                        Text("Search",
                        style: Styles.headlineStyle4,)
                      ],
                    ),
                  ),
                  const Gap(40),
                  const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View All"),
                ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            padding:  EdgeInsets.only(left: AppLayout.getWidth(20)),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
            child: const AppDoubleTextWidget(bigText: "Hotels", smallText: "View All"),
          ),
          const Gap(15),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
                    children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
          ),
            ),
             ]
      ),
    );
  }
}