import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';

class UserOrderHistory extends StatelessWidget {
  final List<OrderItemModel> userOrderHistory;
  final bool isDataProcessing;

  const UserOrderHistory({
    super.key,
    required this.userOrderHistory,
    required this.isDataProcessing,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return isDataProcessing
        ? const LoadingIndicator()
        : userOrderHistory.isEmpty
            ? SizedBox(
                height: mediaQueryData.size.height * 0.04,
                child: Text('userHasNoOrders'.tr()),
              )
            : ListOfOrderItems(
                orderItems: userOrderHistory,
              );
  }
}
