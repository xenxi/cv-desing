import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/navigators/i_navigator.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(
    this.navigator,
  ) : super(NavigationState.initial()) {
    on<NavigationEvent>((event, emit) async {
      emit(state.copyWith(path: event.routeName));
      await navigator.navigateTo(event.routeName);
    });
  }
  final INavigator navigator;
}
