part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  factory NavigationState.initial() =>
      const NavigationState(routeName: AppRouter.initial);
  const NavigationState({
    required this.routeName,
  });
  final String routeName;
  @override
  List<Object> get props => [routeName];

  NavigationState copyWith({
    String? routeName,
  }) {
    return NavigationState(
      routeName: routeName ?? this.routeName,
    );
  }
}
