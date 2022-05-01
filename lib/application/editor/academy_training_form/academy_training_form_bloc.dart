// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cv_desing_website_flutter/domain/failure.dart';
import 'package:cv_desing_website_flutter/domain/title.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'academy_training_form_event.dart';
part 'academy_training_form_state.dart';

class AcademyTrainingFormBloc
    extends Bloc<AcademyTrainingFormEvent, AcademyTrainingFormState> {
  AcademyTrainingFormBloc() : super(AcademyTrainingFormState.initial()) {
    on<AcademyTrainingFormEvent>((event, emit) {
      if (event is TitleChanged) {
        emit(state.copyWith(title: Title.create(event.title)));
      }
    });
  }
}
