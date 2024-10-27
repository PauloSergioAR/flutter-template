import 'package:flutter_modular/flutter_modular.dart';

import '../data/data_layer.dart';
import '../infra/infra.dart';
import 'modules/modules.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [NetworkModule()];

  @override
  void binds(i) {
    i
      ..addSingleton(ExampleDataSource.new)
      ..addSingleton(GlobalCubit.new);
  }

  @override
  void routes(r) {
    r
      ..module(
        Modular.initialRoute,
        module: SplashModule(),
      )
      ..module(Routes.home, module: HomeModule());
  }
}
