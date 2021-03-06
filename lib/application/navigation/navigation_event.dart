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

class HomeOpened extends NavigationEvent {
  const HomeOpened() : super(AppRouter.home, Location.home);
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

class CvEditorOpened extends NavigationEvent {
  const CvEditorOpened() : super(AppRouter.editor, Location.cvEditor);
}
