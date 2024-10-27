// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra/infra.dart';
import 'cubit/splash_cubit.dart';
import 'cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late SplashCubit _cubit;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, .5),
      ),
    );

    _animationController.addStatusListener((AnimationStatus status) {
      if (status.isCompleted) {
        Modular.to.navigate(Routes.home);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      bloc: _cubit,
      listener: (_, state) async {
        if (!state.isLoading) {
          Modular.to.navigate(state.currentRoute);
        }
      },
      builder: (_, __) {
        return Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, __) {
                return Center(
                  child: AnimatedOpacity(
                    duration: _animationController.duration!,
                    opacity: _animation.value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.width),
                      child: UiImages.appIcon(),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
