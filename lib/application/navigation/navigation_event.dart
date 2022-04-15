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

class DesingsOpened extends NavigationEvent {
  const DesingsOpened() : super(AppRouter.desings, Location.desings);
}

class AuthenticationOpened extends NavigationEvent {
  const AuthenticationOpened() : super(AppRouter.auth, Location.auth);
}

class DesingDetailsOpened extends NavigationEvent {
  const DesingDetailsOpened({required String reference})
      : super(
          '${AppRouter.desings}/$reference',
          '${Location.desings}/$reference',
        );
}
