import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String currentRoute;

  const HomeState({
    this.isLoading = false,
    this.currentRoute = '',
  });

  HomeState copyWith({
    bool? isLoading,
    bool? needUpdate,
    String? currentRoute,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        currentRoute,
      ];
}
