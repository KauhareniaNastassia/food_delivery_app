import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderHistoryPageContent extends StatelessWidget {
  const OrderHistoryPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history_outlined,
            size: size.width * 0.15,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            'Order history coming soon',
            style:
                AppTextStyles.size18WeightSemiBoldText(AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
