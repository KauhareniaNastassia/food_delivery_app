import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_page_view/main_page.dart';
import 'package:order_history/order_history.dart';

class OrderHistoryPageContent extends StatelessWidget {
  const OrderHistoryPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigateToPageBloc navigateToPageBloc =
        context.read<NavigateToPageBloc>();

    return Scaffold(
      body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (BuildContext context, OrderHistoryState state) {
          if (state.orderItems.isEmpty) {
            return EmptyOrderHistoryScreen(
              onPressed: () {
                navigateToPageBloc.add(
                  NavigateToShoppingCartPageEvent(),
                );
              },
            );
          } else if (state.isLoading) {
            return const LoadingIndicator();
          } else {
            return ListOfOrderItems(
              orderItems: state.orderItems,
            );
          }
        },
      ),
    );
  }
}
