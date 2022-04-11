part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  factory NavigationState.initial() =>
      const NavigationState(path: AppRouter.initial);
  const NavigationState({
    required this.path,
  });
  final String path;
  @override
  List<Object> get props => [path];

  NavigationState copyWith({
    String? path,
  }) {
    return NavigationState(
      path: path ?? this.path,
    );
  }
}
