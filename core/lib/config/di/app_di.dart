import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/navigation.dart';

final AppDI appDI = AppDI();
final instance = GetIt.instance;

class AppDI {
  void initDependencies() {
    final fireStore = FirebaseFirestore.instance;
    instance.registerLazySingleton<FirebaseFirestore>(() => fireStore);

    setupNavigationDependencies();
  }
}
