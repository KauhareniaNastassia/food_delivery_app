import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigation/navigation.dart';

import 'data_di.dart';

final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() async {
    DataDI().initDependencies();

    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    instance.registerLazySingleton<FirebaseFirestore>(() => fireStore);

    setupNavigationDependencies();
  }
}
