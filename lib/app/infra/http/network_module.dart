import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/data_layer.dart';
import '../../domain/domain_layer.dart';
import '../infra.dart';

class NetworkModule extends Module {
  @override
  void exportedBinds(i) {
    i
      ..addLazySingleton(() => Dio())
      ..addLazySingleton<HttpImp>(HttpImp.new)
      ..addLazySingleton(GetAuthUseCase.new)
      ..addLazySingleton(SetAuthUseCase.new)
      ..addLazySingleton(ExampleDataSource.new)
      ..addLazySingleton(GlobalCubit.new)
      ..addLazySingleton(SharedHelper.new);
  }
}
