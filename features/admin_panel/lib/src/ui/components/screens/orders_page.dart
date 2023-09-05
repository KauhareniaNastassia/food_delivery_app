import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrdersPageContent extends StatelessWidget {
  const OrdersPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ScrollController scrollController = ScrollController();
    final AdminPanelBloc adminPanelBloc = context.read<AdminPanelBloc>();

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (BuildContext context, AdminPanelState state) {
        if (state.isDataProcessing) {
          return const LoadingIndicator();
        } else {
          return Scaffold(
            bottomNavigationBar: BottomBar(
              buttonTitle: 'checkNewOrders'.tr(),
              onPressed: () {
                adminPanelBloc.add(
                  InitOrdersEvent(),
                );
              },
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CategoryFilter(
                        filterItems: AppConstants.orderStatus,
                        onTap: (String filterValue) {
                          adminPanelBloc.add(
                            FilterOrdersByCompleteEvent(
                              filterValue: filterValue,
                            ),
                          );
                        },
                        selectedFilter: state.selectedOrdersFilter,
                      ),
                      SizedBox(height: mediaQueryData.size.height * 0.01),
                      OrderItemsList(
                        orderItemsList: state.selectedOrdersFilter ==
                                AppConstants.orderStatus[0]
                            ? state.unCompletedOrdersList
                            : state.completedOrdersList,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
