part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  factory NavigationState.initial() => const NavigationState(
        path: AppRouter.initial,
        displayName: Location.home,
      );
  const NavigationState({
    required this.path,
    required this.displayName,
  });
  final String path;
  final String displayName;
  @override
  List<Object> get props => [path, displayName];

  NavigationState copyWith({
    String? path,
    String? displayName,
  }) {
    return NavigationState(
      path: path ?? this.path,
      displayName: displayName ?? this.displayName,
    );
  }
}
