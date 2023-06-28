import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core_ui.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpinKitSpinningLines(
            color: AppColors.primaryColor,
            size: 100,
          ),
          const SizedBox(height: 30),
          Text(
            'Loading',
            style:
                AppTextStyles.size22Weight600Text(AppColors.primaryDarkColor),
          )
        ],
      ),
    );
  }
}
