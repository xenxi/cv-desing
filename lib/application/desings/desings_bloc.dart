// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/domain/desing.dart';
import 'package:cv_desing_website_flutter/domain/i_desings.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'desings_event.dart';
part 'desings_state.dart';

class DesingsBloc extends Bloc<DesingsEvent, DesingsState> {
  DesingsBloc(
    this.desings,
  ) : super(DesingsState.initial()) {
    on<DesingsEvent>((event, emit) async {
      if (event is FilterCategoryChanged) {
        emit(
          state.copyWith(
            isLoading: true,
            desings: const [],
            categoryOption: Some(event.category),
          ),
        );
        final failureOrDesings = await desings.search(category: event.category);

        emit(
          state.copyWith(
            isLoading: false,
            desings: failureOrDesings.getOrElse(() => []),
          ),
        );
      }
    });
  }
  final IDesings desings;
}
