import 'package:delivery/utils/app_layout.dart';
import 'package:delivery/utils/app_styles.dart';
import 'package:delivery/widgets/column_layout.dart';
import 'package:delivery/widgets/layout_builder_widget.dart';
import 'package:delivery/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(169),
      child: Container(
        margin:  EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration:  BoxDecoration(
                color: isColor==null?  Color(0xFF526799): Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),
                topRight: Radius.circular(AppLayout.getHeight(21))
                ),
              ),
              padding:  EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                        style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white): Styles.headlineStyle3,
                      ),
                      const Spacer(),
                      ThickContainer(isColor: true),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: const AppLayoutBuilderWidget(
                                sections: 6),
                            // LayoutBuilder(
                            //   builder: (BuildContext , BoxConstraints constraints) {
                            //     print("The width is ${constraints.constrainWidth()}");
                            //     return  Flex(
                            //       direction: Axis.horizontal,
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: List.generate((constraints.constrainWidth()/6).floor(),
                            //               (index) => SizedBox(
                            //             width: 3, height: 1, child: DecoratedBox(decoration: BoxDecoration(
                            //               color: isColor==null? Colors.white:Colors.grey.shade300),
                            //               ),
                            //           )),
                            //     );
                            //   },
                            // ),
                          ),
                          Center(
                            child: Transform.rotate(angle: 1.5,
                                child: Icon(Icons.local_airport_rounded, color: isColor==null? Colors.white: Color(0xFF8ACCF7),)
                            ),
                          ),
                        ],
                      ),
                      ),
                      ThickContainer(isColor: true),
                      const Spacer(),
                      Text(ticket['to']['code'], style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['from']['name'], style: isColor==null?  Styles.headlineStyle4.copyWith(color: Colors.white): Styles.headlineStyle4),
                      ),
                      Text(ticket['flying_time'], style: isColor==null?  Styles.headlineStyle4.copyWith(color: Colors.white): Styles.headlineStyle4 ,),
                      SizedBox(
                        width: AppLayout.getWidth(100), child: Text(ticket['to']['name'], textAlign: TextAlign.end ,style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white): Styles.headlineStyle4,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: isColor==null? Styles.orangeColor: Colors.white,
              child: Row(
                children:  [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade300: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        )
                        )
                      ),
                    ),
                  Expanded(child: Padding(
                    padding:  EdgeInsets.all(AppLayout.getHeight(12)),
                    child: LayoutBuilder(builder: (BuildContext , BoxConstraints constraints) {
                      assert(BuildContext != null);
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
                          width: AppLayout.getWidth(5),height: AppLayout.getHeight(1),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: isColor==null? Colors.grey.shade300:Colors.white,
                            ),
                          ),
                        ),
                        ),
                      );
                    },
                    ),
                  ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: isColor==null? Colors.grey.shade300: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppLayout.getHeight(10)),
                              bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                            )
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:  BoxDecoration(
                color: isColor==null? Styles.orangeColor: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(isColor==null?21:0)),
                    bottomRight: Radius.circular(AppLayout.getHeight(isColor==null?21:0))
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                          firstText: ticket['date'],
                          secondText: "Date",
                          alignment: CrossAxisAlignment.start, isColor: isColor),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(ticket['date'],
                      //       style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white): Styles.headlineStyle3,),
                      //     const Gap(5),
                      //     Text("Date",
                      //       style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                      //   ],
                      // ),
                      AppColumnLayout(
                          firstText: ticket['departure_time'],
                          secondText: "Departure time",
                          alignment: CrossAxisAlignment.center, isColor: isColor),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Text(ticket['departure_time'], style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
                      //     const Gap(5),
                      //     Text("Departure time", style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                      //   ],
                      // ),
                      AppColumnLayout(
                          firstText: ticket['number'].toString(),
                          secondText: "Number",
                          alignment: CrossAxisAlignment.end, isColor: isColor),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Text(ticket['number'].toString(), style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
                      //     const Gap(5),
                      //     Text("Number", style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
                      //   ],
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
