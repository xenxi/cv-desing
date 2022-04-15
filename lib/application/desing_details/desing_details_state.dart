part of 'desing_details_bloc.dart';

abstract class DesingDetailsState extends Equatable {
  const DesingDetailsState();

  @override
  List<Object> get props => [];
}

class Loading extends DesingDetailsState {}

class LoadSuccess extends DesingDetailsState {
  const LoadSuccess(this.desing);

  final Desing desing;

  @override
  List<Object> get props => [desing];
}
