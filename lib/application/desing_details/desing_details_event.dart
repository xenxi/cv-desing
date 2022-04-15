part of 'desing_details_bloc.dart';

abstract class DesingDetailsEvent extends Equatable {
  const DesingDetailsEvent();

  @override
  List<Object> get props => [];
}

class DesingOpened extends DesingDetailsEvent {
  const DesingOpened({required this.reference});

  final String reference;

  @override
  List<Object> get props => [reference];
}
