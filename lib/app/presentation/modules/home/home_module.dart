import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/presentation/modules/home/home_page.dart';
import '../../../infra/infra.dart';
import 'cubit/home_cubit.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [NetworkModule()];

  @override
  void binds(i) {
    i.addSingleton(HomeCubit.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (args) => const HomePage());
  }
}
