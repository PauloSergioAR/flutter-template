import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isLoading;
  final bool needUpdate;
  final String currentRoute;

  const SplashState({
    this.isLoading = false,
    this.needUpdate = false,
    this.currentRoute = '',
  });

  SplashState copyWith({
    bool? isLoading,
    bool? needUpdate,
    String? currentRoute,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      needUpdate: needUpdate ?? this.needUpdate,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        needUpdate,
        currentRoute,
      ];
}
