import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
