part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent(
    this.routePath,
    this.displayName,
  );
  final String routePath;
  final String displayName;

  @override
  List<Object> get props => [routePath, displayName];
}

class NavigateToHomeSelected extends NavigationEvent {
  const NavigateToHomeSelected() : super(AppRouter.home, Location.home);
}

class NavigateToDesingsSelected extends NavigationEvent {
  const NavigateToDesingsSelected()
      : super(AppRouter.desings, Location.desings);
}
