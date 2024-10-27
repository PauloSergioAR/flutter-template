import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/domain_layer.dart';
import '../../../infra/infra.dart';
import 'cubit/splash_cubit.dart';
import 'splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [NetworkModule()];

  @override
  void binds(i) {
    i
      ..addSingleton(SplashCubit.new)
      ..addSingleton(GlobalCubit.new)
      ..addSingleton(GetAuthUseCase.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (args) => const SplashPage());
  }
}
