part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent(
    this.routeName,
  );
  final String routeName;

  @override
  List<Object> get props => [routeName];
}

class NavigateToHomeSelected extends NavigationEvent {
  const NavigateToHomeSelected() : super(AppRouter.home);
}

class NavigateToDesingsSelected extends NavigationEvent {
  const NavigateToDesingsSelected() : super(AppRouter.desings);
}
