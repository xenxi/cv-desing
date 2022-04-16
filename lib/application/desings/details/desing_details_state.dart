part of 'desing_details_bloc.dart';

abstract class DesingDetailsState extends Equatable {
  const DesingDetailsState();

  @override
  List<Object> get props => [];
}

class Loading extends DesingDetailsState {}

class LoadFailure extends DesingDetailsState {
  const LoadFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => [failure];
}

class LoadSuccess extends DesingDetailsState {
  const LoadSuccess(this.desing);

  final Desing desing;

  @override
  List<Object> get props => [desing];
}
