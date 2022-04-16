part of 'desings_bloc.dart';

abstract class DesingsEvent extends Equatable {
  const DesingsEvent();

  @override
  List<Object> get props => [];
}

class FilterCategoryChanged extends DesingsEvent {
  const FilterCategoryChanged({required this.category});
  final Category category;

  @override
  List<Object> get props => [category];
}
