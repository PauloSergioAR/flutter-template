import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());
}

class GlobalState extends Equatable {
  final bool isLoading;

  const GlobalState({
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        isLoading,
      ];

  GlobalState copyWith({
    bool? isLoading,
  }) {
    return GlobalState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
