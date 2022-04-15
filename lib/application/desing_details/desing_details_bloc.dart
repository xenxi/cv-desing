// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:equatable/equatable.dart';

part 'desing_details_event.dart';
part 'desing_details_state.dart';

class DesingDetailsBloc extends Bloc<DesingDetailsEvent, DesingDetailsState> {
  DesingDetailsBloc(this.desings) : super(Loading()) {
    on<DesingDetailsEvent>((event, emit) {
      if (event is DesingOpened) {
        desings.getByReference(event.reference).then(
              (failureOrDesing) => emit(
                failureOrDesing.fold(
                  (failure) => LoadFailure(failure),
                  (desing) => LoadSuccess(desing),
                ),
              ),
            );
      }
    });
  }
  final IDesings desings;
}
