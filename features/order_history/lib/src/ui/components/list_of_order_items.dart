import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class ListOfOrderItems extends StatelessWidget {
  final List<OrderItemModel> orderItems;

  const ListOfOrderItems({
    super.key,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderItems.length,
            itemBuilder: (_, int index) {
              return Column(
                children: <Widget>[
                  OrderItem(
                    orderItem: orderItems[index],
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.02),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
