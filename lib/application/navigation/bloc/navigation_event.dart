part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent(
    this.routeName,
    this.displayName,
  );
  final String routeName;
  final String displayName;

  @override
  List<Object> get props => [routeName, displayName];
}

class NavigateToHomeSelected extends NavigationEvent {
  const NavigateToHomeSelected() : super(AppRouter.home, Location.home);
}

class NavigateToDesingsSelected extends NavigationEvent {
  const NavigateToDesingsSelected()
      : super(AppRouter.desings, Location.desings);
}
